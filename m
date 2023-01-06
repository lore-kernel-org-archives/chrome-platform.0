Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540607B
	for <chrome-platform@lists.linux.dev>; Fri,  6 Jan 2023 08:54:39 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id ja17so602054wmb.3
        for <chrome-platform@lists.linux.dev>; Fri, 06 Jan 2023 00:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iyQcVsjNCuxQT38p/12jXZi+sWxLlHg0zB8RFcHQKGo=;
        b=YLnKR3PiyRE/KnFQNF44rQ1yVv5XOs+BemNgn5/DYZRqgtnLYQ1iadZeJ9MgMkYJME
         IKyj+04mZw/6YWs2AcYOnPJUAC3ml7RUHu4MQEoMd8L5B0wXCI4pf5xjMnJcWcnIt57f
         dM16hq86p/OvqUXBoZVaVQoYgwRLWUXPyjbEYg8leD6G3zkINiFFDt0NQIDW5EpKCkwF
         PToCjAz01pOtK0HkTdo3opVpsaQht1YBXogmehX5rNf8dDzmO98u4TxV0EJWb1JuLr7Z
         tby3VzLNZw0PXSjh1jsc+OkIacNEdTHoiQq0WasFtmPq/W3AMjairwFk8rajF2i8d/v2
         C8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iyQcVsjNCuxQT38p/12jXZi+sWxLlHg0zB8RFcHQKGo=;
        b=oyniiZvQbLW63fiISBn/OYGJbXR3JrQrB84brVFOU8jOywXviQmZB4gdhSfnL+8xXG
         hE5OX0XL1TWgeOEjoiSm19xAk9svtfl+1qNA24ZFaul2Q4fS7xP5YXn/gji635CVO7vX
         2QL2ErF7nTq5+LsvGc9KDo/vsumr/XjljyMOW0qgCy2kNPJcP27xKEazYZMKK0VWcgy5
         /NwV6sO4q7+pSCN9TrHStkO10gMmu1KLnIV069kKH4bxOn1/1KsXnYjS/eGtSQq3PEeO
         zvwm4xFPXe51zgODlI18+vj4PPzXZBKIqzJ38ZpD+3yWzSXGd/YFypUfWhtArXaCwkpr
         0BkA==
X-Gm-Message-State: AFqh2krgLdr+cL0K5ptq4AolW7rn/eLAxAXJz5+2nYykV06r/Rd08ka7
	THn/yIkza/MeuUxgbrXve3JPfyZkYQtjKw==
X-Google-Smtp-Source: AMrXdXsNmNfoxSPQlC/opq1ItxlQZUCT7XYbd1ngPrQ9EVtQo9/bIYUKchuvcEdmjALVT25bfaNIJQ==
X-Received: by 2002:a05:600c:1f18:b0:3cf:5583:8b3f with SMTP id bd24-20020a05600c1f1800b003cf55838b3fmr37220019wmb.20.1672995277466;
        Fri, 06 Jan 2023 00:54:37 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id iv14-20020a05600c548e00b003b47b80cec3sm6081219wmb.42.2023.01.06.00.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 00:54:37 -0800 (PST)
Date: Fri, 6 Jan 2023 11:54:27 +0300
From: Dan Carpenter <error27@gmail.com>
To: bhanumaiya@chromium.org
Cc: chrome-platform@lists.linux.dev
Subject: [bug report] platform/chrome: cros_ec_uart: Add transport layer
Message-ID: <Y7fhw4S7Tb0GcHMF@kili>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Bhanu Prakash Maiya,

The patch 04a8bdd135cc: "platform/chrome: cros_ec_uart: Add transport
layer" from Dec 27, 2022, leads to the following Smatch static
checker warning:

	drivers/platform/chrome/cros_ec_uart.c:152 cros_ec_uart_pkt_xfer()
	warn: 'ret' possible negative type promoted to high

drivers/platform/chrome/cros_ec_uart.c
    130 static int cros_ec_uart_pkt_xfer(struct cros_ec_device *ec_dev,
    131                                  struct cros_ec_command *ec_msg)
    132 {
    133         struct cros_ec_uart *ec_uart = ec_dev->priv;
    134         struct serdev_device *serdev = ec_uart->serdev;
    135         struct response_info *resp = &ec_uart->response;
    136         struct ec_host_response *host_response;
    137         unsigned int len;
                ^^^^^^^^^^^^^^^^

    138         int ret, i;
    139         u8 sum;
    140 
    141         len = cros_ec_prepare_tx(ec_dev, ec_msg);
    142         dev_dbg(ec_dev->dev, "Prepared len=%d\n", len);
    143 
    144         /* Setup for incoming response */
    145         resp->data = ec_dev->din;
    146         resp->max_size = ec_dev->din_size;
    147         resp->size = 0;
    148         resp->exp_len = 0;
    149         resp->status = 0;
    150 
    151         ret = serdev_device_write_buf(serdev, ec_dev->dout, len);
--> 152         if (ret < len) {

If serdev_device_write_buf() returns negative then type promotion means
this condition is false.  Write it like:

	if (ret < 0 || ret != len) {
		dev_err(ec_dev->dev, "Unable to write data\n");
		if (ret >= 0)
			ret = -EIO;
		goto exit;
	}

    153                 dev_err(ec_dev->dev, "Unable to write data\n");
    154                 ret = -EIO;
    155                 goto exit;
    156         }
    157 
    158         ret = wait_event_timeout(resp->wait_queue, resp->status,
    159                                  msecs_to_jiffies(EC_MSG_DEADLINE_MS));
    160         if (ret == 0) {
    161                 dev_warn(ec_dev->dev, "Timed out waiting for response.\n");
    162                 ret = -ETIMEDOUT;
    163                 goto exit;
    164         }
    165 
    166         if (resp->status < 0) {
    167                 ret = resp->status;
    168                 dev_warn(ec_dev->dev, "Error response received: %d\n", ret);
    169                 goto exit;
    170         }
    171 
    172         host_response = (struct ec_host_response *)ec_dev->din;
    173         ec_msg->result = host_response->result;
    174 
    175         if (host_response->data_len > ec_msg->insize) {
    176                 dev_err(ec_dev->dev, "Resp too long (%d bytes, expected %d)\n",
    177                         host_response->data_len, ec_msg->insize);
    178                 ret = -ENOSPC;


ret = -EINVAL;  (Unless you are discussing harddrives).

    179                 goto exit;
    180         }
    181 
    182         /* Validate checksum */
    183         sum = 0;
    184         for (i = 0; i < sizeof(*host_response) + host_response->data_len; i++)
    185                 sum += ec_dev->din[i];
    186 
    187         if (sum) {
    188                 dev_err(ec_dev->dev, "Bad packet checksum calculated %x\n", sum);
    189                 ret = -EBADMSG;
    190                 goto exit;
    191         }
    192 
    193         memcpy(ec_msg->data, ec_dev->din + sizeof(*host_response), host_response->data_len);
    194 
    195         ret = host_response->data_len;
    196 
    197 exit:
    198         /* Invalidate response buffer to guard against out of band rx data */
    199         resp->data = NULL;
    200 
    201         if (ec_msg->command == EC_CMD_REBOOT_EC)
    202                 msleep(EC_REBOOT_DELAY_MS);
    203 
    204         return ret;
    205 }

regards,
dan carpenter
