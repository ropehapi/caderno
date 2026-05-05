# Código de Acesso do Convidado

**Data:** 2026-04-28  
**Status:** Implementado

---

## Demanda

Prevenir que pessoas mal-intencionadas confirmem ou desconfirmem presença e reservem presentes em nome de outros convidados. Os endpoints públicos de RSVP e reserva de presente não exigiam nenhuma forma de autenticação do convidado — qualquer pessoa com o `guestID` poderia agir em nome de qualquer convidado.

---

## Planejamento

### Decisão de design

Gerar um código numérico de 6 dígitos (`access_code`) para cada convidado no momento do cadastro. O código é:

- **Gerado aleatoriamente** com `crypto/rand` (criptograficamente seguro)
- **Imutável** — não muda após o cadastro
- **Visível apenas pelo dono do casamento** — aparece na resposta dos endpoints autenticados (`GET /v1/guests`), nunca na listagem pública
- **Exigido nas ações públicas** — RSVP e reserva de presente

### Fluxo de uso

1. Anfitrião cadastra convidado → recebe o código na resposta (`access_code`)
2. Anfitrião compartilha o código com o convidado (WhatsApp, convite impresso etc.)
3. Convidado usa o código para confirmar presença ou reservar presente

### Validação de erro

| Código inválido | HTTP 403 Forbidden |
|---|---|
| Convidado não encontrado | HTTP 404 Not Found |
| Presente já reservado | HTTP 409 Conflict |

---

## Execução

### Migration

`migrations/000009_add_access_code_to_guests.up.sql`
- Adiciona coluna `CHAR(6) NOT NULL` na tabela `guests`
- Popula convidados existentes com códigos aleatórios via `random()`

### Arquivos alterados

| Arquivo | Mudança |
|---|---|
| `internal/domain/guest.go` | Campo `AccessCode string` adicionado ao struct |
| `internal/repository/guest.go` | `generateAccessCode()` com `crypto/rand`; `Create` inclui `access_code` no INSERT |
| `internal/service/guest.go` | `RSVP` recebe `accessCode string`; novo método `ValidateGuestCode`; interface `GuestService` atualizada |
| `internal/handler/public.go` | `rsvpRequest` + `reserveGiftRequest` exigem `access_code`; `ReserveGift` valida o convidado antes de reservar; `handleError` trata `ErrForbidden` |
| `internal/handler/guest.go` | `guestResponse` expõe `access_code` para o dono do casamento |
| `internal/service/guest_test.go` | Testes de RSVP atualizados; `TestRSVP_WrongAccessCode` adicionado |

### Contrato da API alterado

**POST `/v1/public/{slug}/guests/{guestID}/rsvp`**
```json
{
  "status": "confirmed",
  "access_code": "123456"
}
```

**POST `/v1/public/{slug}/gifts/{giftID}/reserve`**
```json
{
  "guest_id": "uuid-do-convidado",
  "access_code": "123456"
}
```
> O campo `guest_name` foi substituído por `guest_id` + `access_code`. O nome do convidado é recuperado internamente pelo serviço.
