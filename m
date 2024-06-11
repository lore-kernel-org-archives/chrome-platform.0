Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF946F2F0
	for <chrome-platform@lists.linux.dev>; Tue, 11 Jun 2024 18:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718129466; cv=none; b=usEzLRCEDPkJAI1mf8B8bz6iooG5+nQzpU2G/qnK+1LIdwJuruIhwv0X8gpANEzKd8WbajdprELNGy9buFj40+yiB/R6J5CPym19gTwwJS0q8AJB330uJXXDyCLvkSjSDkh9RLw1JzWPde+7jamPZ8nTjZW3oWiS1YrQ94/vgKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718129466; c=relaxed/simple;
	bh=/xKGhKlVtckIy/7F23998tEUprsrx5eNTrMKCF2kraE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UD8P4WRudq0qg6Ss616OJIapaxG65Q/bieHZIfhFG6VxHjgAJIPLqgUrc/8i7J0l1lT4HxPRqT9wGpB9oBeb8UWBGTlE+bkP2LN0O78OaS9dzix1bvZedgBbO6pTYpMUtmqjf9ldUaVLj44V7K6ymYaHqVrI3ZTonW0BEUpE4hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TH+mrOnH; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TH+mrOnH"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1f44b441b08so10290825ad.0
        for <chrome-platform@lists.linux.dev>; Tue, 11 Jun 2024 11:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718129464; x=1718734264; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6yx/QSwtRUfzJxtU0mEMF/+Zp84UMg5zsjelSYKknQk=;
        b=TH+mrOnHY4g1NH9St6GClvH8MVnpVEfUVJU8A7FD0P+TtzGkd1dScHgzEIiHj7gQys
         Aday0+C01aFcw0S/Q7+XLQDyCWc+P/Vj8rGaDrFL7Ml037FwxPji18TUbN+IbJPvDHMQ
         h2DEzRcg527zcyUdSqCyhoB6tI7fpVJeYbOLOGh68pAz2yd2kKefEsw0scKlHIkEKvFs
         WIiYQGXknNCqjBteaJzXkDa7lLMEniPtUxpsiIAChqzBPfvJ3zz35M3XKtNYzFZiHMlL
         ui+vRhGWq+AKmhS5xaDtBe5f9qiskNeSHpP/pQpQkI/7O+N6i3fncXnzdRw8/sRXPjOV
         /vWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718129464; x=1718734264;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6yx/QSwtRUfzJxtU0mEMF/+Zp84UMg5zsjelSYKknQk=;
        b=ojAN2XPBpBzvdNz2q80gsPSmU7gQmVbHAFtWdTgiUySLTtnf8ukO4qOKiCeV3fFV71
         GlUFKr8q17Avppg/cyi+hAJL/wj5GbufuSyBdLeHin3plzyKJa6oY1KHdUBUZHBveDsx
         m5R2Lr9w0nAIKO70gnBmCnw+R4F6UAOpMR+XSHV+Oz86VvH5rijwOVcK8e13JPBV/v5g
         ngWLq5J+dyVU76avEAHr8S/lKasHiZQ7++vqtYdds1hOATuTZF35IDXqCefUdg7+E+Dy
         1+u38iAjcXL4adrjpTEdID7otGK2Z/kTtUF9JxrUHVVybsAwyTLqbACAzclu8gv8ZGdd
         5kMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfFk4pBWb7STKe7Rei6Ja4oY3hWfOJt8N0PnIbNELxFztMcchLhiXEvAeQJk0TOJaRqjBIjPehSmjwiIpxbKVoK8ChG9IG49LSXNQdyHe9
X-Gm-Message-State: AOJu0Yzm6CAeJ0GSsX0YkviO2HeM9T/gwe2tBTtKZ2Zl6pWZlQoUNf1d
	9EWYI1YKnCwBOcT+lUwKs1o1g8G9rBU2sbh2Fqyr+kdpAkYlJhDM
X-Google-Smtp-Source: AGHT+IGCIHAzQY/mnDlVo5lnk26RTRbDcrjvObXR8MxjwovVfl11tONs9+ylnI51Lr9jyeCjcjK5IQ==
X-Received: by 2002:a17:902:ea0e:b0:1f7:2dca:ea42 with SMTP id d9443c01a7336-1f72dcaf4acmr29493525ad.60.1718129463715;
        Tue, 11 Jun 2024 11:11:03 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:d73f:b49c:626c:fac7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6ed8ee0f1sm71482315ad.124.2024.06.11.11.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 11:11:03 -0700 (PDT)
Date: Tue, 11 Jun 2024 11:11:00 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Daisuke Nojiri <dnojiri@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Reka Norman <rekanorman@chromium.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Pavan Holla <pholla@chromium.org>,
	Gwendal Grignou <gwendal@chromium.org>,
	Lukasz Majczak <lma@chromium.org>,
	Ching-Kang Yen <chingkang@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/3] platform/chrome: Add struct
 ec_response_get_next_event_v3
Message-ID: <ZmiTNEjxE-ZCotNu@google.com>
References: <cover.1717779167.git.dnojiri@chromium.org>
 <979b1fdaa5b3d3165e53f5429470c42581394d14.1717779167.git.dnojiri@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <979b1fdaa5b3d3165e53f5429470c42581394d14.1717779167.git.dnojiri@chromium.org>

Hi Daisuke,

On Fri, Jun 07, 2024 at 10:02:56AM -0700, Daisuke Nojiri wrote:
> Add struct ec_response_get_next_event_v3 to upgrade
> EC_CMD_GET_NEXT_EVENT to version 3.
> 
> Signed-off-by: Daisuke Nojiri <dnojiri@chromium.org>
> ---
>  .../linux/platform_data/cros_ec_commands.h    | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
> index 070e49c5381e..fff191a8d413 100644
> --- a/include/linux/platform_data/cros_ec_commands.h
> +++ b/include/linux/platform_data/cros_ec_commands.h
> @@ -3527,6 +3527,34 @@ union __ec_align_offset1 ec_response_get_next_data_v1 {
>  };
>  BUILD_ASSERT(sizeof(union ec_response_get_next_data_v1) == 16);
>  
> +union __ec_align_offset1 ec_response_get_next_data_v3 {
> +	uint8_t key_matrix[18];
> +
> +	/* Unaligned */
> +	uint32_t host_event;
> +	uint64_t host_event64;
> +
> +	struct __ec_todo_unpacked {
> +		/* For aligning the fifo_info */
> +		uint8_t reserved[3];
> +		struct ec_response_motion_sense_fifo_info info;
> +	} sensor_fifo;
> +
> +	uint32_t buttons;
> +
> +	uint32_t switches;
> +
> +	uint32_t fp_events;
> +
> +	uint32_t sysrq;
> +
> +	/* CEC events from enum mkbp_cec_event */
> +	uint32_t cec_events;
> +
> +	uint8_t cec_message[16];
> +};
> +BUILD_ASSERT(sizeof(union ec_response_get_next_data_v3) == 18);
> +
>  struct ec_response_get_next_event {
>  	uint8_t event_type;
>  	/* Followed by event data if any */
> @@ -3539,6 +3567,12 @@ struct ec_response_get_next_event_v1 {
>  	union ec_response_get_next_data_v1 data;
>  } __ec_align1;
>  
> +struct ec_response_get_next_event_v3 {
> +	uint8_t event_type;
> +	/* Followed by event data if any */
> +	union ec_response_get_next_data_v3 data;
> +} __ec_align1;
> +

It is not really obvious that ec_response_get_next_event and
ec_response_get_next_event_v3 are layout compatible. I would simply
extend the union and add key_matrix_v3 field instead of defining
a brand new union.

And I would drop ec_response_get_next_event_v1 and added missing fields
to the original union as well...

Thanks.

-- 
Dmitry
