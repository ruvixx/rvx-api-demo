package at.avdev.ruvixx;

import at.avdev.ruvixx.utils.ApiService;
import at.avdev.ruvixx.utils.ApiServiceImpl;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class BeansConfiguration
{
    @Bean
    public ApiService apiService()
    {
        return new ApiServiceImpl();
    }
}