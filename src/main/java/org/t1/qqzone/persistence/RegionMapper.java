package org.t1.qqzone.persistence;

import java.util.List;

import org.t1.qqzone.domain.City;
import org.t1.qqzone.domain.District;
import org.t1.qqzone.domain.Province;

public interface RegionMapper {

	/*************
	 * 
	 * @return
	 * 
	 * 		查询所有省份
	 * 
	 */
	public List<Province> findAllProvinces();

	/****************
	 * 
	 * @param provinceId
	 * @return
	 * 
	 * 		查询所有城市
	 * 
	 */
	public List<City> queryAllCitysByProvinceId(Integer provinceId);

	/**********************
	 * 
	 * @param cityId
	 * @return
	 * 
	 * 		查询所有区
	 * 
	 */
	public List<District> queryAllDistrictByCityId(Integer cityId);

}
