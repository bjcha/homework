/*package com.example.rsupport.demo.jpa.test;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

import java.util.List;

import org.junit.After;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.example.rsupport.demo.jpa.domain.Notify;
import com.example.rsupport.demo.jpa.repository.NotifyRepository;

@RunWith(SpringRunner.class)
@SpringBootTest
public class RepositoryTest {
	
	@Autowired
	NotifyRepository notifyRepository;

    @Test
    public void testCustomerRepository(){
    	Notify notify = Notify.builder().name("크리스").build();
    	notifyRepository.save(notify);

        List<Notify> list = notifyRepository.findAll();

        Notify chris = list.get(0);
        assertThat(chris.getName(), is("크리스"));
        
        
    }

    @After
    public void deleteAll(){
    	notifyRepository.deleteAll();
    }

}
*/