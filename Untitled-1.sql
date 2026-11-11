create DATABASE FormativaBanco;
use FormativaBanco;

create table clientes(
    Idclientes int PRIMARY KEY IDENTITY(1,1),
    nome varchar(100) NOT NULL,
    cpf char(11) not NULL UNIQUE,
    email varchar(100) NOT NULL UNIQUE,
    telefone VARCHAR(20) NOT NULL,
    nascimento date NULL,
    ativo bit NOT NULL CONSTRAINT Fk_clientes_ativos default 1
);


select * from clientes

create table instrutores(
    Idinstrutor int PRIMARY KEY IDENTITY(1,1),
    nome varchar(100) NOT NULL,
    CREF VARCHAR(20) not NULL UNIQUE,
    especialidade varchar(80) not NULL,
    email varchar(100) not null UNIQUE,
    ativo bit CONSTRAINT Df_instrutores_ativos default 1
);

select * from instrutores

create TABLE planosDeTreino(
    Idplanos int PRIMARY KEY IDENTITY(1,1),
    NomePlano varchar(80) NOT NULL UNIQUE,
    valor DECIMAL(10,2) not null CHECK (valor > 0),
    DuracaoMeses int NOT NULL CHECK (DuracaoMeses BETWEEN 1 and 24),
    Acessolivre bit default 0
);

select * from planosDeTreino

create table aulasEmodalidades(
    Idmoda int PRIMARY KEY IDENTITY(1,1),
    nomeModalidade varchar(80) NOT NULL UNIQUE,
    nivel VARCHAR(20) not null,
    DuracaoMinutos int NOT NULL CHECK (DuracaoMinutos > 0),
    descricao varchar(200) NULL
);

select * from aulasEmodalidades

create TABLE matriculas(
    Id int primary key IDENTITY(1,1),
    IdCliente int not null FOREIGN KEY (IdClientes) REFERENCES clientes(Idclientes),
    IdPlano int not null FOREIGN KEY (Idplanos) REFERENCES planosDeTreino(Idplanos),
    DataInicio date not NULL,
    StatusMatricula varchar(15) not null CONSTRAINT Df_status_matricula default 'ativa',
    Desconto decimal(5,2) default 0 CHECK (Desconto BETWEEN 0 and 100)
); 

select * from matriculas

create table aulas(
    IdAula int PRIMARY KEY IDENTITY(1,1),
    IdModalidade int not null FOREIGN KEY (IdModalidade) REFERENCES aulasEmodalidades(Idmoda),
    Idinstrutores int not null FOREIGN KEY (Idinstrutores) REFERENCES instrutores(Idinstrutor),
    DataAula date not null,
    horario time NOT NULL,
    vagas int not null CHECK (vagas BETWEEN 1 and 50),
    sala VARCHAR(30) NOT NULL
);

select * from aulas