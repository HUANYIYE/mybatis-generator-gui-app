package ${basePackage}.controller;
import ${servicePackage}.bean.${modelNameUpperCamel};
import ${servicePackage}.service.${modelNameUpperCamel}Service;
import ${servicePackage}.bean.${modelNameUpperCamel}Example;
import com.github.pagehelper.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;
import com.xcar.ad.push.enums.ResponseEnum;
import org.springframework.beans.factory.annotation.Autowired;
import com.xcar.ad.push.common.util.JsonUtils;
import io.swagger.annotations.*;
import com.xcar.ad.push.util.ResultVoUtil;
import com.xcar.ad.push.model.vo.ResultVo;
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
    @ApiImplicitParam(name = "param", value = "${modelNameUpperCamel}参数", paramType = "${modelNameUpperCamel}")
    @PostMapping("/add")
    public String add(${modelNameUpperCamel} param) {
        ResultVo resultVo = null;
        try {
            ${modelNameLowerCamel}Service.save(param);
            resultVo = ResultVoUtil.success();
        } catch (Exception e) {
            log.error("添加异常：add{}{}", param.toString(), e.getStackTrace());
            resultVo = ResultVoUtil.fail(ResponseEnum.ADD_ERROR);
        }
        return JsonUtils.encode(resultVo);
    }

    @ApiOperation(value = "delete", notes = "删除")
    @ApiImplicitParam(name = "id", value = "id", paramType = "Integer")
    @DeleteMapping("/delete")
    public String delete(@RequestParam Integer id) {
        ResultVo resultVo = null;
        try {
	        ${modelNameLowerCamel}Service.deleteById(id);
            resultVo = ResultVoUtil.success();
        } catch (Exception e) {
            log.error("删除异常：delete{}{}",id , e.getStackTrace());
            resultVo = ResultVoUtil.fail(ResponseEnum.DELETE_ERROR);
        }
	    return JsonUtils.encode(resultVo);
    }

    @ApiOperation(value = "update", notes = "修改")
    @ApiImplicitParam(name = "param", value = "${modelNameUpperCamel}参数", paramType = "${modelNameUpperCamel}")
    @PutMapping("/update")
    public String update(${modelNameUpperCamel} param) {
        ResultVo resultVo = null;
        try {
	        ${modelNameLowerCamel}Service.update(param);
            resultVo = ResultVoUtil.success();
	     } catch (Exception e) {
            log.error("修改异常：update{}{}",param.toString() , e.getStackTrace());
            resultVo = ResultVoUtil.fail(ResponseEnum.UPDATE_ERROR);
        }
	    return JsonUtils.encode(resultVo);
    }

    @ApiOperation(value = "get", notes = "根据ID查询")
    @ApiImplicitParam(name = "id", value = "id", paramType = "Integer")
    @GetMapping("/get")
    public String get(@RequestParam Integer id) {
        ResultVo resultVo = null;
        try {
            ${modelNameUpperCamel} ${modelNameLowerCamel} = ${modelNameLowerCamel}Service.findById(id);
            resultVo = ResultVoUtil.success(${modelNameLowerCamel});
        } catch (Exception e) {
            log.error("查询异常：get id={}{}", id, e.getStackTrace());
            resultVo = ResultVoUtil.fail(ResponseEnum.SELECT_ERROR);
        }
        return JsonUtils.encode(resultVo);
    }


    @ApiOperation(value = "list", notes = "分页查询")
    @ApiImplicitParams({ @ApiImplicitParam(name = "page", value = "页数", paramType = "Integer"),
                         @ApiImplicitParam(name = "size", value = "每页数量", paramType = "Integer"),
                         @ApiImplicitParam(name = "param", value = "查询条件", paramType = "${modelNameUpperCamel}") })
    @GetMapping("/list")
    public String list(@RequestParam(defaultValue = "0") Integer page, @RequestParam(defaultValue = "0") Integer size, ${modelNameUpperCamel} param) {
        ResultVo resultVo = null;
        PageHelper.startPage(page, size);
        try {
            ${modelNameUpperCamel}Example ${modelNameLowerCamel}Example = new ${modelNameUpperCamel}Example();
            List<${modelNameUpperCamel}> list = ${modelNameLowerCamel}Service.findAll(${modelNameLowerCamel}Example);
            PageInfo pageInfo = new PageInfo(list);
            resultVo = ResultVoUtil.success(pageInfo);
        } catch (Exception e) {
            log.error("查询异常：list{}{}", param.toString(), e.getStackTrace());
            resultVo = ResultVoUtil.fail(ResponseEnum.SELECT_ERROR);
        }
        return JsonUtils.encode(resultVo);
    }
}
