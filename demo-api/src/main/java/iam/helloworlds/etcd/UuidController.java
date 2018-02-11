package iam.helloworlds.etcd;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.net.SocketException;

@RestController
public class UuidController {
    @Autowired
    private String assignedUuid;

    @RequestMapping("/uuid")
    public String index() throws SocketException {
        return assignedUuid;
    }
}