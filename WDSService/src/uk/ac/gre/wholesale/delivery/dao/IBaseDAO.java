package uk.ac.gre.wholesale.delivery.dao;

import java.util.List;

public interface IBaseDAO<T> {
	public T persist(T entity);

    public T edit(T entity);
    
    public T remove(long id);

    public T remove(T entity);

	public List<T> findAll();

    public T find(Long id);
}
