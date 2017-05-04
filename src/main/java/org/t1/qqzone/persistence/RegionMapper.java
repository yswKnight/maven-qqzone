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
	 * 		��ѯ����ʡ��
	 * 
	 */
	public List<Province> findAllProvinces();

	/****************
	 * 
	 * @param provinceId
	 * @return
	 * 
	 * 		��ѯ���г���
	 * 
	 */
	public List<City> queryAllCitysByProvinceId(Integer provinceId);

	/**********************
	 * 
	 * @param cityId
	 * @return
	 * 
	 * 		��ѯ������
	 * 
	 */
	public List<District> queryAllDistrictByCityId(Integer cityId);

}
