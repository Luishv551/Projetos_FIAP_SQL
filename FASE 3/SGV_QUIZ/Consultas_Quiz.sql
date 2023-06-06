select sum(vl_salario), nm_depto
from mc_funcionario,mc_depto
where mc_funcionario.cd_depto = mc_depto.cd_depto
group by mc_depto.nm_depto

select *
from mc_depto

select sum(vl_salario)
from mc_funcionario
where cd_depto = 2

SELECT CD_PRODUTO, NM_PRODUTO, PERCENTUAL_LUCRO
FROM MC_PRODUTO
WHERE PERCENTUAL_LUCRO > (SELECT AVG(PERCENTUAL_LUCRO) FROM MC_PRODUTO);

select ds_produto, vl_perc_lucro
from mc_produto
where vl_perc_lucro > (select avg(vl_perc_lucro) from mc_produto);