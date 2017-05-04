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
	 * 		��ѯ����ʡ��
	 */
	public List<Province> findAllProvinces();

	/*************
	 * 
	 * @param provinceId
	 * @return
	 * 
	 * 		����ʡ�ݲ����
	 * 
	 */
	public List<City> queryAllCitysByProvinceId(Integer provinceId);

	/***********
	 * 
	 * @param cityId
	 * @return
	 * 
	 * 		���ݳ��в���
	 * 
	 */
	public List<District> queryAllDistrictsByCityId(Integer cityId);
}
