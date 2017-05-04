package org.t1.qqzone.service;

import java.util.List;

import org.t1.qqzone.domain.City;
import org.t1.qqzone.domain.District;
import org.t1.qqzone.domain.Province;

public interface RegionService {

	/**************
	 * 
	 * @return
	 * 
	 * 		查询所有省份
	 */
	public List<Province> findAllProvinces();

	/*************
	 * 
	 * @param provinceId
	 * @return
	 * 
	 * 		根据省份查城市
	 * 
	 */
	public List<City> queryAllCitysByProvinceId(Integer provinceId);

	/***********
	 * 
	 * @param cityId
	 * @return
	 * 
	 * 		根据城市查区
	 * 
	 */
	public List<District> queryAllDistrictsByCityId(Integer cityId);
}
