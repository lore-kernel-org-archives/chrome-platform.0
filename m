Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCC928E1
	for <chrome-platform@lists.linux.dev>; Wed,  7 Dec 2022 22:30:11 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id o12so19031936pjo.4
        for <chrome-platform@lists.linux.dev>; Wed, 07 Dec 2022 14:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CkMKMEemwpbk/daVT3wz6uonUC/mWzDsPO2TugqFnFs=;
        b=fEcjMeBw8OEXjRzvgzIU6KrICKdIxvExhVmyoeFXQdzU+t4exH0ckCw9npkeE8vchO
         cWM34qCRH+j2gYVEZZhe8MkEJWPHYVlkL2ovKCcWWRLA2saIx91gryj1eOKdE4pTqRj0
         m+koQ/QOo28CKI8O2NOPg+zpR5tTJ6aWOy8LE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CkMKMEemwpbk/daVT3wz6uonUC/mWzDsPO2TugqFnFs=;
        b=vsYzUBsgmuWOYfns6cD5UgsOuIywKgAmLcQNoUaznuVwIALPgPeEnNlG+DzeWZavjw
         J/iAj22vPza0bicOjR+4D1E5aq3Kn4uF4FJ06YWo8G9LPH6t5fog5ITvGydZasfgqtSu
         lCUrqokcIRCdU9Ly6+xKqOqT/o9lkXO9tDJVLP3JfoHzWJF8aNnjSEs76VgRfc6Yr+nT
         VHWa0YXfwgjuVwC9xsruwiKjns5NeMvzEHSm/0Ii7an+lFcgSt+fzfNS/vU+1q9hfX3w
         OKvBBXB6hKlNcQEZZG7Ym+S/dmvxIjvRUit9PgRhuk2rNk3qVxIIeIQoyBUXRkLQds7a
         Qagg==
X-Gm-Message-State: ANoB5pkbmm7Ot6HR9ToVjffESX2lbXPwepwAe4SCr3c5s/P4IhdhnW2g
	Xfy2ir+UBdPyp1rWaKgDNthGAg==
X-Google-Smtp-Source: AA0mqf6lIaq8B+RTyASAyN0TyOhkL3/MjzEkzcCUWjTPGU4+tm81VDg9C5AhrhmBVDx+w//M7VtPJg==
X-Received: by 2002:a17:90b:4c81:b0:213:f498:ebaf with SMTP id my1-20020a17090b4c8100b00213f498ebafmr1134142pjb.5.1670452210704;
        Wed, 07 Dec 2022 14:30:10 -0800 (PST)
Received: from chromium.org (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id nb14-20020a17090b35ce00b00219186abd7csm1659069pjb.16.2022.12.07.14.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 14:30:10 -0800 (PST)
Date: Wed, 7 Dec 2022 22:30:09 +0000
From: Prashant Malani <pmalani@chromium.org>
To: Mark Hasemeyer <markhas@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Raul Rangel <rrangel@chromium.org>,
	Bhanu Prakash Maiya <bhanumaiya@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev
Subject: Re: [PATCH v10 1/3] platform/chrome: cros_ec_uart: Add cros-ec-uart
 transport layer
Message-ID: <Y5ET8a3WBntlOfU5@chromium.org>
References: <20221207104005.v10.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221207104005.v10.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>

Hi Mark & Bhanu,

Mostly style nits; once addressed, please add my reviewed tag (FWIW):

Reviewed-by: Prashant Malani <pmalani@chromium.org>

On Dec 07 10:40, Mark Hasemeyer wrote:
> +
> +/**
> + * struct response_info - Encapsulate EC response related
> + *			information for passing between function
> + *			cros_ec_uart_pkt_xfer() and cros_ec_uart_rx_bytes()
> + *			callback.
> + * @data:		Copy the data received from EC here.
> + * @max_size:		Max size allocated for the @data buffer. If the
> + *			received data exceeds this value, we log an error.
> + * @size:		Actual size of data received from EC. This is also
> + *			used to accumulate byte count with response is received
> + *			in dma chunks.
> + * @exp_len:		Expected bytes of response from EC including header.
> + * @status:		Re-init to 0 before sending a cmd. Updated to 1 when
> + *			a response is successfully received, or a negative
> + *			integer on failure.
nit: You mean error number specifically, right? Otherwise it can just be
any negative integer, and the caller shouldn't bother checking anything other than " < 0".
> +
> +	memcpy(ec_uart->response.data + ec_uart->response.size, data, count);
> +
> +	ec_uart->response.size += count;
> +
> +	/*
> +	 * Read data_len if we received response header and if exp_len
> +	 * was not read before.
> +	 */
nit: Comment can fit on 1 line.

> +	if (ec_uart->response.size >= sizeof(*response) &&
> +	    ec_uart->response.exp_len == 0) {
> +		response = (struct ec_host_response *) ec_uart->response.data;
> +		ec_uart->response.exp_len = response->data_len + sizeof(*response);
> +	}
> +
> +	/*
> +	 * If driver received response header and payload from EC,
> +	 * Wake up the wait queue.
> +	 */
nit: Comment can fit on 1 line.

> +	/* Setup for incoming response */
> +	ec_uart->response.data = ec_dev->din;
> +	ec_uart->response.max_size = ec_dev->din_size;
> +	ec_uart->response.size = 0;
> +	ec_uart->response.exp_len = 0;
> +	ec_uart->response.status = 0;
> +
> +	ret = serdev_device_write_buf(serdev, ec_dev->dout, len);
> +	if (ret < len) {
> +		dev_err(ec_dev->dev, "Unable to write data");
nit: Please end with a "\n".
> +		ret = -EIO;
> +		goto exit;
> +	}
> +
> +	ret = wait_event_timeout(ec_uart->response.wait_queue,
> +				 ec_uart->response.status,
> +				 msecs_to_jiffies(EC_MSG_DEADLINE_MS));
> +	if (ret == 0) {
> +		dev_warn(ec_dev->dev, "Timed out waiting for response.\n");
> +		ret = -ETIMEDOUT;
> +		goto exit;
> +	}
> +
> +	if (ec_uart->response.status < 0) {
> +		dev_warn(ec_dev->dev, "Error response received: %d\n", ec_uart->response.status);
> +		ret = ec_uart->response.status;
> +		goto exit;
> +	}
> +
> +	response = (struct ec_host_response *)ec_dev->din;
> +	ec_msg->result = response->result;
> +
> +	if (response->data_len > ec_msg->insize) {
> +		dev_err(ec_dev->dev, "Resp too long (%d bytes, expected %d)", response->data_len,
nit: Please end with a "\n".

Best regards,

-Prashant
