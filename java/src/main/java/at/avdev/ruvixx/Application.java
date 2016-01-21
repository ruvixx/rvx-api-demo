package at.avdev.ruvixx;

import at.avdev.ruvixx.pojos.*;
import at.avdev.ruvixx.utils.ApiService;
import at.avdev.ruvixx.utils.Tools;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.context.annotation.Import;
import org.springframework.http.HttpEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Component
@Import(BeansConfiguration.class)
public class Application implements CommandLineRunner
{
    private static final Logger LOG = LoggerFactory.getLogger(Application.class);
    private static final String URL = "<-- need this -->";
    private static final String KEY = "<-- need this -->";
    private static final String SECRET = "<-- need this -->";

    @Autowired
    private ApiService apiService;


    @Override
    public void run(String... args) throws Exception
    {
        String url = "/api/v1/incidents";

        Payload payload = new Payload();
        payload.setName("AV Invalid Scan - United States");
        payload.setIncidentNumber("AV0001");
        payload.setIncidentUrl("http://av.com/incident/13939");
        payload.setDescription("varchar(255)");
        payload.setIncidentText("LONGTEXT");
        payload.setStatus(new Status(1));
        payload.setCountry(new Country("United States"));
        payload.setReportingEntity(new ReportingEntity("SAMPLE REPORTER"));
        payload.setInfringementType(new InfringementType(7, "Counterfeiting"));
        payload.setIncidentType(new IncidentType(4, "Website"));
        payload.setIncidentDate(new Date());

        List<IdentifiedUnknownProduct> identifiedUnknownProducts = new ArrayList<>();
        IdentifiedUnknownProduct identifiedUnknownProduct = new IdentifiedUnknownProduct();
        identifiedUnknownProduct.setProduct(new Product("MODELNUM", "BRANDNAME"));
        identifiedUnknownProduct.setQuantity(1);
        identifiedUnknownProduct.setAmount(29.99);
        List<Technology> technologies = new ArrayList<>();
        technologies.add(new Technology("HDMI"));
        identifiedUnknownProduct.setTechnologies(technologies);
        identifiedUnknownProducts.add(identifiedUnknownProduct);
        payload.setIdentifiedUnknownProducts(identifiedUnknownProducts);


        // calculate authorization header
        ObjectMapper mapper = new ObjectMapper();
        String date = Tools.toHTTPDateString(new Date());
        String payloadString = mapper.writeValueAsString(payload);
        String md5 = Tools.MD5(payloadString);
        String contentType = "application/json";

        String authorization = this.apiService.calculateSignature(SECRET, date, url, md5, contentType);

        MultiValueMap<String, String> headers = new LinkedMultiValueMap<>();
        headers.add("Authorization", "APIAuth " + KEY + ":" + authorization);
        headers.add("DATE", date);
        headers.add("Content-MD5", md5);
        headers.add("Content-Type", contentType);

        RestTemplate restTemplate = new RestTemplate();
        restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());

        HttpEntity<Payload> request = new HttpEntity<>(payload, headers);
        payload = restTemplate.postForObject(URL + url, request, Payload.class, new HashMap<>());

        LOG.info("Response {}", payload);
    }

    public static void main(String[] args)
    {
        SpringApplication.run(Application.class);
    }
}
