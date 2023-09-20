Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4C61171F
	for <chrome-platform@lists.linux.dev>; Wed, 20 Sep 2023 09:10:25 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-50308217223so6154971e87.3
        for <chrome-platform@lists.linux.dev>; Wed, 20 Sep 2023 02:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695201024; x=1695805824; darn=lists.linux.dev;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2h7cs036UrR/eQjftEBWFTHYb+KQvYnSOLcHTnPuW8s=;
        b=k3JEczjGrOCgTgSOs4rjxg//ubVL3M/RR9vh4hfZ2KTCQjDufRYjihkJh97PGa6VUG
         0NZNAeQG4Jp1NCeBe0xPSslF0OSkbYI6QqaAwcIGHu75ef1Y9ant1PdL//GFvuOVTlLH
         cb/BE+fQzGi3pURNy+tmle+I6xsQwgR+Pj5ELXIEP2wg0BYclIyC3zIHhVy7GgSH5lA1
         S/zigrjbpcXehQX3M50qpeX8V0fLymUHH/4QcR8tNB0zDfJXo4MxptS1EymhzW+4hXQ0
         e0FEVloQE4Pbo3Q2rVUNUsPJXyzzbX+pmJYJ89fQTpJP/TgMaPM405xXQB0GycUk+H9F
         o+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695201024; x=1695805824;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2h7cs036UrR/eQjftEBWFTHYb+KQvYnSOLcHTnPuW8s=;
        b=BbSLLJSZ1zAvRPM8iXXbtknuDvfDSqvjzjBnoYIHjQ0/X12qHvO4EyO6LKbaXdQ34j
         e5yoSvQaJPrL00h78xoilxl3IyMiq25gy+EK9Pb97KD3jst+4v4/9wvKGyjcfrN2g7Q/
         5iwZlTbF7PAh6V1HhJRlPyfhaTCqp0FBhybKoFwqiFAFCZ7zrcf9oWx+VcJ5jYY+6CNP
         qlKefFDMFPQOv6/tsx22gLvIQvtE2xobwS3JusVI9cqBViTuFBAOeYwXC0ilqDXlP7c9
         A0BXlPou/nNEs8GIzUA8nKcCncYWePI3dXHiVQAjxMpz4da7DZXXfY9AJWBO765l+cFJ
         4TDA==
X-Gm-Message-State: AOJu0YzIm5m3rGiVRV0e95FJuniYrKuHtBaO1shYwnxtK/tKV57V87kB
	21JcR05iO3o0b/Q10aLMf6Y=
X-Google-Smtp-Source: AGHT+IE61TkCmGwn0OosPff6JVitQ32jcllylkHwIbApW8CSo7sYCCWxxzkmjYV95OPAVmm3JOoIIQ==
X-Received: by 2002:ac2:5041:0:b0:503:2623:7cfc with SMTP id a1-20020ac25041000000b0050326237cfcmr1489636lfm.34.1695201023290;
        Wed, 20 Sep 2023 02:10:23 -0700 (PDT)
Received: from [192.168.1.103] ([178.176.76.10])
        by smtp.gmail.com with ESMTPSA id p12-20020ac246cc000000b004ff9ee35739sm2609505lfo.283.2023.09.20.02.10.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Sep 2023 02:10:22 -0700 (PDT)
Subject: Re: [PATCH v4 5/5] usb: typec: intel_pmc_mux: Configure Displayport
 Alternate mode 2.1
To: Utkarsh Patel <utkarsh.h.patel@intel.com>, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
Cc: heikki.krogerus@linux.intel.com, pmalani@chromium.org,
 chrome-platform@lists.linux.dev, andriy.shevchenko@linux.intel.com,
 bleung@chromium.org
References: <20230920023243.2494410-1-utkarsh.h.patel@intel.com>
 <20230920023243.2494410-6-utkarsh.h.patel@intel.com>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <086a35c5-6402-3e3e-1ac4-fade2797b63a@gmail.com>
Date: Wed, 20 Sep 2023 12:10:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230920023243.2494410-6-utkarsh.h.patel@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 9/20/23 5:32 AM, Utkarsh Patel wrote:

> Mux agent driver can configure cable details such as cable type and
> cable speed received as a part of displayport configuration to support
> Displayport Alternate mode 2.1.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Utkarsh Patel <utkarsh.h.patel@intel.com>
> ---
> Changes in v4:
> - No change.
> 
> Changes in v3:
> - No change.
> 
> Changes in v2:
> - No change.
> 
>  drivers/usb/typec/mux/intel_pmc_mux.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/usb/typec/mux/intel_pmc_mux.c b/drivers/usb/typec/mux/intel_pmc_mux.c
> index 60ed1f809130..233958084b43 100644
> --- a/drivers/usb/typec/mux/intel_pmc_mux.c
> +++ b/drivers/usb/typec/mux/intel_pmc_mux.c
[...]
> @@ -293,6 +299,24 @@ pmc_usb_mux_dp(struct pmc_usb_port *port, struct typec_mux_state *state)
>  	req.mode_data |= (state->mode - TYPEC_STATE_MODAL) <<
>  			 PMC_USB_ALTMODE_DP_MODE_SHIFT;
>  
> +	if (!is_pmc_mux_tbt(port->pmc->iom_adev)) {
> +		u8 cable_speed = (data->conf & DP_CONF_SIGNALLING_MASK) >>
> +				  DP_CONF_SIGNALLING_SHIFT;
> +
> +		u8 cable_type = (data->conf & DP_CONF_CABLE_TYPE_MASK) >>
> +				 DP_CONF_CABLE_TYPE_SHIFT;
> +
> +		req.mode_data |= PMC_USB_ALTMODE_CABLE_SPD(cable_speed);
> +
> +		if (cable_type == DP_CONF_CABLE_TYPE_OPTICAL)
> +			req.mode_data |= PMC_USB_ALTMODE_CABLE_TYPE;
> +		else if (cable_type == DP_CONF_CABLE_TYPE_RE_TIMER)
> +			req.mode_data |= PMC_USB_ALTMODE_ACTIVE_CABLE |
> +					 PMC_USB_ALTMODE_RETIMER_CABLE;
> +		else if (cable_type == DP_CONF_CABLE_TYPE_RE_DRIVER)
> +			req.mode_data |= PMC_USB_ALTMODE_ACTIVE_CABLE;

   Why not *switch* instead of string of *if*s?

> +	}
> +
>  	ret = pmc_usb_command(port, (void *)&req, sizeof(req));
>  	if (ret)
>  		return ret;

MBR, Sergey
