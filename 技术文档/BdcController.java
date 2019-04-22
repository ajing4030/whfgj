package web.boot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/rest/fg")
@Controller
public class BdcController {
	@Autowired
	private JdbcTemplate template;
	@RequestMapping(value = "/GetFwXzxx", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public String GetFwXzxx() {
		String sql = "select value_ from t_bdc_test a where a.mark='GetFwXzxx' ";
		String json = template.queryForObject(sql, String.class);
		return json;

	}
	@RequestMapping(value = "/GetFwxxs", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public String GetFwxxs() {
		String sql = "select value_ from t_bdc_test a where a.mark='GetFwxxs' ";
		String json = template.queryForObject(sql, String.class);
		return json;

	}
	@RequestMapping(value = "/GetTdxx",method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public String GetTdxx() {
		String sql = "select value_ from t_bdc_test a where a.mark='GetTdxx' ";
		String json = template.queryForObject(sql, String.class);
		return json;
		
	}
	@RequestMapping(value = "/GetXzxx", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public String GetXzxx() {
		String sql = "select value_ from t_bdc_test a where a.mark='GetXzxx' ";
		String json = template.queryForObject(sql, String.class);
		return json;
		
	}
	@RequestMapping(value = "/GetCdghXzyy", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public String GetCdghXzyy() {
		String sql = "select value_ from t_bdc_test a where a.mark='GetCdghXzyy' ";
		String json = template.queryForObject(sql, String.class);
		return json;
		
	}
	@RequestMapping(value = "/GetTdDyxx", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public String GetTdDyxx() {
		String sql = "select value_ from t_bdc_test a where a.mark='GetTdDyxx' ";
		String json = template.queryForObject(sql, String.class);
		return json;
		
	}
	@RequestMapping(value = "/GetTdCfxx", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public String GetTdCfxx() {
		String sql = "select value_ from t_bdc_test a where a.mark='GetTdCfxx' ";
		String json = template.queryForObject(sql, String.class);
		return json;
		
	}
	@RequestMapping(value = "/GetFwdjxxByBdcdyh", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public String GetFwdjxxByBdcdyh() {
		String sql = "select value_ from t_bdc_test a where a.mark='GetFwdjxxByBdcdyh' ";
		String json = template.queryForObject(sql, String.class);
		return json;
		
	}
	@RequestMapping(value = "/GetCxXzxxByFwbh", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public String GetCxXzxxByFwbh() {
		String sql = "select value_ from t_bdc_test a where a.mark='GetCxXzxxByFwbh' ";
		String json = template.queryForObject(sql, String.class);
		return json;
		
	}
	@RequestMapping(value = "/GetSyqdjxx", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public String GetSyqdjxx() {
		String sql = "select value_ from t_bdc_test a where a.mark='GetSyqdjxx' ";
		String json = template.queryForObject(sql, String.class);
		return json;
		
	}
}
