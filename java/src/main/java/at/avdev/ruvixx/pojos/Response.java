package at.avdev.ruvixx.pojos;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Response
{
    private Long id;
    private String error;


    public Response() {}

    public Response(Long id, String error)
    {
        this.id = id;
        this.error = error;
    }


    public Long getId()
    {
        return id;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public String getError()
    {
        return error;
    }

    public void setError(String error)
    {
        this.error = error;
    }

    @Override
    public String toString()
    {
        return "Response{" +
                "id=" + id +
                ", error='" + error + '\'' +
                '}';
    }
}
