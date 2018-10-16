package ${basePackage}.service.impl;

import ${basePackage}.dao.${modelNameUpperCamel}Mapper;
import ${basePackage}.bean.${modelNameUpperCamel};
import ${basePackage}.bean.${modelNameUpperCamel}Example;
import ${basePackage}.service.${modelNameUpperCamel}Service;
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;
import javax.annotation.Resource;

/**
 *
 * Created by ${author} on ${date}.
 */
@Service
@Slf4j
public class ${modelNameUpperCamel}ServiceImpl extends BaseServiceImpl<${modelNameUpperCamel},Long,${modelNameUpperCamel}Example> implements ${modelNameUpperCamel}Service {

    private ${modelNameUpperCamel}Mapper ${modelNameLowerCamel}Mapper;

    @Resource
    public void set${modelNameUpperCamel}Mapper(${modelNameUpperCamel}Mapper ${modelNameLowerCamel}Mapper) {
        super.setBaseMapper(${modelNameLowerCamel}Mapper);
        this.${modelNameLowerCamel}Mapper = ${modelNameLowerCamel}Mapper;
    }

}
