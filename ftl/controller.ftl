package ${basePackage}.controller;
import ${servicePackage}.bean.${modelNameUpperCamel};
import ${servicePackage}.service.${modelNameUpperCamel}Service;
import ${servicePackage}.bean.${modelNameUpperCamel}Example;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;
import com.xcar.ad.push.common.util.JsonUtils;


import java.util.List;

/**
 *
 * Created by ${author} on ${date}.
 */
@RestController
public class ${modelNameUpperCamel}Controller {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    ${modelNameUpperCamel}Service ${modelNameLowerCamel}Service;

    @RequestMapping("/add")
    public String add(${modelNameUpperCamel} ${modelNameLowerCamel}) {
        ${modelNameLowerCamel}Service.save(${modelNameLowerCamel});
        return JsonUtils.encode(true);
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam Long id) {
	    ${modelNameLowerCamel}Service.deleteById(id);
	    return JsonUtils.encode(true);
    }

    @RequestMapping("/update")
    public String update(${modelNameUpperCamel} ${modelNameLowerCamel}) {
	    ${modelNameLowerCamel}Service.update(${modelNameLowerCamel});
	    return JsonUtils.encode(true);
    }

    @RequestMapping("/detail")
    public String detail(@RequestParam Long id) {
        ${modelNameUpperCamel} ${modelNameLowerCamel} = ${modelNameLowerCamel}Service.findById(id);
        return JsonUtils.encode(${modelNameLowerCamel});
    }

    @RequestMapping("/list")
    public String list(@RequestParam(defaultValue = "0") Integer page, @RequestParam(defaultValue = "0") Integer size, ${modelNameUpperCamel} ${modelNameLowerCamel}) {
        PageHelper.startPage(page, size);
        ${modelNameUpperCamel}Example ${modelNameLowerCamel}Example = new ${modelNameUpperCamel}Example();
        List<${modelNameUpperCamel}> list = ${modelNameLowerCamel}Service.findAll(${modelNameLowerCamel}Example);
        PageInfo pageInfo = new PageInfo(list);
        return JsonUtils.encode(pageInfo);
    }
}
