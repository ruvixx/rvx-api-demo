package at.avdev.ruvixx.pojos;

import at.avdev.ruvixx.utils.JsonDateSerializer;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

import java.util.Date;
import java.util.List;

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonIgnoreProperties(ignoreUnknown = true)
public class Payload
{
    private Long id;
    private String name;
    @JsonProperty("incident_num")
    private String incidentNumber;
    @JsonProperty("incident_url")
    private String incidentUrl;
    private String description;
    @JsonProperty("incident_text")
    private String incidentText;

    private Status status;
    private Country country;
    @JsonProperty("reporting_entity")
    private ReportingEntity reportingEntity;
    @JsonProperty("infringement_type")
    private InfringementType infringementType;
    @JsonProperty("incident_type")
    private IncidentType incidentType;

    @JsonProperty("incident_date")
    @JsonSerialize(using = JsonDateSerializer.class)
    private Date incidentDate;

    @JsonProperty("identified_unknown_products")
    private List<IdentifiedUnknownProduct> identifiedUnknownProducts;


    public Payload() {}

    public Payload(Long id, String name, String incidentNumber, String incidentUrl, String description, String incidentText, Status status, Country country, ReportingEntity reportingEntity, InfringementType infringementType, IncidentType incidentType, Date incidentDate, List<IdentifiedUnknownProduct> identifiedUnknownProducts)
    {
        this.id = id;
        this.name = name;
        this.incidentNumber = incidentNumber;
        this.incidentUrl = incidentUrl;
        this.description = description;
        this.incidentText = incidentText;
        this.status = status;
        this.country = country;
        this.reportingEntity = reportingEntity;
        this.infringementType = infringementType;
        this.incidentType = incidentType;
        this.incidentDate = incidentDate;
        this.identifiedUnknownProducts = identifiedUnknownProducts;
    }


    public Long getId()
    {
        return id;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getIncidentNumber()
    {
        return incidentNumber;
    }

    public void setIncidentNumber(String incidentNumber)
    {
        this.incidentNumber = incidentNumber;
    }

    public String getIncidentUrl()
    {
        return incidentUrl;
    }

    public void setIncidentUrl(String incidentUrl)
    {
        this.incidentUrl = incidentUrl;
    }

    public String getDescription()
    {
        return description;
    }

    public void setDescription(String description)
    {
        this.description = description;
    }

    public String getIncidentText()
    {
        return incidentText;
    }

    public void setIncidentText(String incidentText)
    {
        this.incidentText = incidentText;
    }

    public Status getStatus()
    {
        return status;
    }

    public void setStatus(Status status)
    {
        this.status = status;
    }

    public Country getCountry()
    {
        return country;
    }

    public void setCountry(Country country)
    {
        this.country = country;
    }

    public ReportingEntity getReportingEntity()
    {
        return reportingEntity;
    }

    public void setReportingEntity(ReportingEntity reportingEntity)
    {
        this.reportingEntity = reportingEntity;
    }

    public InfringementType getInfringementType()
    {
        return infringementType;
    }

    public void setInfringementType(InfringementType infringementType)
    {
        this.infringementType = infringementType;
    }

    public IncidentType getIncidentType()
    {
        return incidentType;
    }

    public void setIncidentType(IncidentType incidentType)
    {
        this.incidentType = incidentType;
    }

    public Date getIncidentDate()
    {
        return incidentDate;
    }

    public void setIncidentDate(Date incidentDate)
    {
        this.incidentDate = incidentDate;
    }

    public List<IdentifiedUnknownProduct> getIdentifiedUnknownProducts()
    {
        return identifiedUnknownProducts;
    }

    public void setIdentifiedUnknownProducts(List<IdentifiedUnknownProduct> identifiedUnknownProducts)
    {
        this.identifiedUnknownProducts = identifiedUnknownProducts;
    }

    @Override
    public String toString()
    {
        return "Payload{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", incidentNumber='" + incidentNumber + '\'' +
                ", incidentUrl='" + incidentUrl + '\'' +
                ", description='" + description + '\'' +
                ", incidentText='" + incidentText + '\'' +
                ", status=" + status +
                ", country=" + country +
                ", reportingEntity=" + reportingEntity +
                ", infringementType=" + infringementType +
                ", incidentType=" + incidentType +
                ", incidentDate=" + incidentDate +
                ", identifiedUnknownProducts=" + identifiedUnknownProducts +
                '}';
    }
}
