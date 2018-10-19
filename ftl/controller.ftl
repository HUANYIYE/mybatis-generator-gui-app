package ${basePackage}.controller;
import ${servicePackage}.bean.${modelNameUpperCamel};
import ${servicePackage}.service.${modelNameUpperCamel}Service;
import ${servicePackage}.bean.${modelNameUpperCamel}Example;
import com.github.pagehelper.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import com.xcar.ad.push.common.util.JsonUtils;
import io.swagger.annotations.*;
import java.util.List;

/**
 *
 * Created by ${author} on ${date}.
 */

@Slf4j
@RestController
@Api("${modelNameUpperCamel}接口")
public class ${modelNameUpperCamel}Controller {


    @Autowired
    ${modelNameUpperCamel}Service ${modelNameLowerCamel}Service;

    @ApiOperation(value = "add", notes = "添加")
    @ApiImplicitParam(name = "${modelNameLowerCamel}", value = "${modelNameUpperCamel}参数", paramType = "${modelNameUpperCamel}")
    @PostMapping("/add")
    public String add(${modelNameUpperCamel} ${modelNameLowerCamel}) {
        ${modelNameLowerCamel}Service.save(${modelNameLowerCamel});
        return JsonUtils.encode(true);
    }

    @ApiOperation(value = "delete", notes = "删除")
    @ApiImplicitParam(name = "id", value = "id", paramType = "Long")
    @DeleteMapping("/delete")
    public String delete(@RequestParam Long id) {
	    ${modelNameLowerCamel}Service.deleteById(id);
	    return JsonUtils.encode(true);
    }

    @ApiOperation(value = "update", notes = "修改")
    @ApiImplicitParam(name = "${modelNameLowerCamel}", value = "${modelNameUpperCamel}参数", paramType = "${modelNameUpperCamel}")
    @PutMapping("/update")
    public String update(${modelNameUpperCamel} ${modelNameLowerCamel}) {
	    ${modelNameLowerCamel}Service.update(${modelNameLowerCamel});
	    return JsonUtils.encode(true);
    }

    @ApiOperation(value = "get", notes = "根据ID查询")
    @ApiImplicitParam(name = "id", value = "id", paramType = "Long")
    @GetMapping("/get")
    public String get(@RequestParam Long id) {
        ${modelNameUpperCamel} ${modelNameLowerCamel} = ${modelNameLowerCamel}Service.findById(id);
        return JsonUtils.encode(${modelNameLowerCamel});
    }


    @ApiOperation(value = "list", notes = "分页查询")
    @ApiImplicitParams({ @ApiImplicitParam(name = "page", value = "页数", paramType = "Integer"),
                         @ApiImplicitParam(name = "size", value = "每页数量", paramType = "Integer"),
                         @ApiImplicitParam(name = "example", value = "查询条件", paramType = "${modelNameUpperCamel}") })
    @GetMapping("/list")
    public String list(@RequestParam(defaultValue = "0") Integer page, @RequestParam(defaultValue = "0") Integer size, ${modelNameUpperCamel} example) {
        PageHelper.startPage(page, size);
        ${modelNameUpperCamel}Example ${modelNameLowerCamel}Example = new ${modelNameUpperCamel}Example();
        List<${modelNameUpperCamel}> list = ${modelNameLowerCamel}Service.findAll(${modelNameLowerCamel}Example);
        PageInfo pageInfo = new PageInfo(list);
        return JsonUtils.encode(pageInfo);
    }
}
