package com.meta.overwash.service;

import java.util.List;

import com.meta.overwash.domain.LaundryDTO;

public interface LaundryService {
	public List<LaundryDTO> getList();

	public int getCount();
}
