package org.t1.qqzone.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.t1.qqzone.domain.City;
import org.t1.qqzone.domain.District;
import org.t1.qqzone.domain.Province;
import org.t1.qqzone.persistence.RegionMapper;
import org.t1.qqzone.service.RegionService;

@Service
public class RegionServiceImpl implements RegionService {

	@Autowired
	private RegionMapper regionMapper;

	@Override
	public List<Province> findAllProvinces() {
		// 查询所有省份
		return this.regionMapper.findAllProvinces();
	}

	@Override
	public List<City> queryAllCitysByProvinceId(Integer provinceId) {
		// 根据省份查询城市
		return this.regionMapper.queryAllCitysByProvinceId(provinceId);
	}

	@Override
	public List<District> queryAllDistrictsByCityId(Integer cityId) {
		// 跟城市查区
		return this.regionMapper.queryAllDistrictByCityId(cityId);
	}

}
