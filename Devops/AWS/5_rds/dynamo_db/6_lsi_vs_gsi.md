<div class="formattedText" data-external-links="">
			<p>O banco de dados DynamoDB possui dois tipos de índices secundários: os locais e os globais. Os índices são chamados de secundários pois ao criar a tabela nós já definimos uma chave primária (junção entre <em>partition key</em> e <em>sort key</em>) e esse é nosso índice “primário”, embora esse termo não seja muito comum.</p>
<p>Os índices secundários locais (<em>Local Secondary Index</em> ou <em>LSI</em>) e índices secundários globais (<em>Global Secondary Index</em> ou <em>GSI</em>) são <strong>muito semelhantes</strong>, tendo apenas as seguintes diferenças:</p>
<ul><li>Um <em>LSI</em> <strong>precisa</strong> ser implementado no momento da criação da tabela. Não é possível criá-los depois. Já um <em>GSI</em> pode ser feito a qualquer momento após a criação da tabela;</li><li><em>LSI</em> <strong>não pode</strong> ter como sua definição uma outra <em>partition key</em>. Apenas a <em>sort key</em> pode ser diferente. Já um <em>GSI</em> pode ter tanto <em>partiion key</em> quanto <em>sort key</em>, diferentes do que foi definido na tabela.</li></ul>
		</div>