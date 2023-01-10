Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AE15244
	for <chrome-platform@lists.linux.dev>; Tue, 10 Jan 2023 03:25:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01964C433D2;
	Tue, 10 Jan 2023 03:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673321127;
	bh=V0fLg2+Z9CZDSB0ugfXcTJBQtY16xD/POYOQUCnTB3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j7UB+GI9bcXXHKZ9TIB4BZlwCXIH9KrnRbIq0zBh7lq99RZqt5y6IiKAcGTh+R3eC
	 0FKmdLtGyX3Ef5IsI0rbFd8hyr/XZfxv7dM/xAUoD+SqA1+lbQzczGLII36g5GHA3Q
	 +YC9O3lF4A94IUJjZ8G1pL5/G+UPechpL6IzFYIi3dVUzIPjG+m8CGWaG2sAowLuns
	 iVvpB1LrM1Ex78NFiLEhx7OiAZF3Axh+wfEWurHrh+V0y0zr1Nfg0GmA4SVVs526Da
	 CZ4thI69z+/OOYdHI7p8BjEJeWbJY2gLVkXtBRj10cwq6LgEtRTVzfSw/B3JW4OLyO
	 lBMcAEQ/+RzNQ==
Date: Tue, 10 Jan 2023 11:25:24 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Dan Carpenter <error27@gmail.com>
Cc: bhanumaiya@chromium.org, chrome-platform@lists.linux.dev
Subject: Re: [bug report] platform/chrome: cros_ec_uart: Add transport layer
Message-ID: <Y7zapHKnXRbK2c5v@google.com>
References: <Y7fhw4S7Tb0GcHMF@kili>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7fhw4S7Tb0GcHMF@kili>

On Fri, Jan 06, 2023 at 11:54:27AM +0300, Dan Carpenter wrote:
> Hello Bhanu Prakash Maiya,
> 
> The patch 04a8bdd135cc: "platform/chrome: cros_ec_uart: Add transport
> layer" from Dec 27, 2022, leads to the following Smatch static
> checker warning:
> 
> 	drivers/platform/chrome/cros_ec_uart.c:152 cros_ec_uart_pkt_xfer()
> 	warn: 'ret' possible negative type promoted to high
> 
> drivers/platform/chrome/cros_ec_uart.c
>     130 static int cros_ec_uart_pkt_xfer(struct cros_ec_device *ec_dev,
>     131                                  struct cros_ec_command *ec_msg)
>     132 {
>     133         struct cros_ec_uart *ec_uart = ec_dev->priv;
>     134         struct serdev_device *serdev = ec_uart->serdev;
>     135         struct response_info *resp = &ec_uart->response;
>     136         struct ec_host_response *host_response;
>     137         unsigned int len;
>                 ^^^^^^^^^^^^^^^^
> 
>     138         int ret, i;
>     139         u8 sum;
>     140 
>     141         len = cros_ec_prepare_tx(ec_dev, ec_msg);
>     142         dev_dbg(ec_dev->dev, "Prepared len=%d\n", len);
>     143 
>     144         /* Setup for incoming response */
>     145         resp->data = ec_dev->din;
>     146         resp->max_size = ec_dev->din_size;
>     147         resp->size = 0;
>     148         resp->exp_len = 0;
>     149         resp->status = 0;
>     150 
>     151         ret = serdev_device_write_buf(serdev, ec_dev->dout, len);
> --> 152         if (ret < len) {
> 
> If serdev_device_write_buf() returns negative then type promotion means
> this condition is false.  Write it like:
> 
> 	if (ret < 0 || ret != len) {
> 		dev_err(ec_dev->dev, "Unable to write data\n");
> 		if (ret >= 0)
> 			ret = -EIO;
> 		goto exit;
> 	}

Fixed in https://patchwork.kernel.org/project/chrome-platform/patch/20230109081554.3792547-1-tzungbi@kernel.org/.

> 
>     153                 dev_err(ec_dev->dev, "Unable to write data\n");
>     154                 ret = -EIO;
>     155                 goto exit;
>     156         }
>     157 
>     158         ret = wait_event_timeout(resp->wait_queue, resp->status,
>     159                                  msecs_to_jiffies(EC_MSG_DEADLINE_MS));
>     160         if (ret == 0) {
>     161                 dev_warn(ec_dev->dev, "Timed out waiting for response.\n");
>     162                 ret = -ETIMEDOUT;
>     163                 goto exit;
>     164         }
>     165 
>     166         if (resp->status < 0) {
>     167                 ret = resp->status;
>     168                 dev_warn(ec_dev->dev, "Error response received: %d\n", ret);
>     169                 goto exit;
>     170         }
>     171 
>     172         host_response = (struct ec_host_response *)ec_dev->din;
>     173         ec_msg->result = host_response->result;
>     174 
>     175         if (host_response->data_len > ec_msg->insize) {
>     176                 dev_err(ec_dev->dev, "Resp too long (%d bytes, expected %d)\n",
>     177                         host_response->data_len, ec_msg->insize);
>     178                 ret = -ENOSPC;
> 
> 
> ret = -EINVAL;  (Unless you are discussing harddrives).

It looks like platform/chrome used the error number for a while for the
case:

$ grep -R ENOSPC drivers/platform/chrome/
drivers/platform/chrome/cros_ec_lpc.c:          ret = -ENOSPC;
drivers/platform/chrome/cros_ec_i2c.c:          ret = -ENOSPC;
drivers/platform/chrome/cros_ec_uart.c:         ret = -ENOSPC;
drivers/platform/chrome/cros_ec_ishtp.c:                return -ENOSPC;
drivers/platform/chrome/cros_ec_spi.c:          ret = -ENOSPC;

I wouldn't feel bother if we keep using the error number.  Otherwise, we
should change all of them.
