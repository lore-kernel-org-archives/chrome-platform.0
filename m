Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641C2538D
	for <chrome-platform@lists.linux.dev>; Thu, 26 Jan 2023 21:00:53 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id 5so3016687plo.3
        for <chrome-platform@lists.linux.dev>; Thu, 26 Jan 2023 13:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k1VrlYk4ybpwtqtLutbYjllW7SLxzj4A88S/3GMWXz0=;
        b=KyX4GHM239zpw0SLa6ilOemKM4AL8PggjPZAiUmVHmBb6Nqm7v2XL1lIx20APvFvXA
         WNr0FSBrZIP8fczsUfkSAazN7nhdeHHDBSsvN7uf2yV4lf13N2bfyg1a4maKF7En6ott
         qt/edecGRpeoHJlrwHexnkNYQgCqvnvjXH00UYHPW9JFJojdJ6kN0elv3idgd9mkCFPe
         cqsxnchaE3u27JBX/RBTMt4rPqMAc/L1roAj3JYMjQnKKX/OPlG46ugjBCibj2SBAcFM
         G9QIHmyxbyMSeTUplU5uLSXpbnwUX73XlcA5ATs4mhJPZ/DXykeMKObKIc4tOTlqSq/9
         p96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k1VrlYk4ybpwtqtLutbYjllW7SLxzj4A88S/3GMWXz0=;
        b=gdmOjUp92fP7zU2qb6vwHsxmI7uuFHBWU24fTAOtA49G+qO4nDmePALU2+LE4V20xF
         /iPG7NkpPEDB8Oi5utjGwIxANfk6CPOj90t0AZArmMsGSHMuNCDrWObbuZ6SVOI4Q5nz
         l5gnRDXPxUz94uwqmVuV+JdL+SczTLYxtiJWfMivt1/80SYILFY2WRnPjz/FTEvqwf34
         eo7cDCneitGrRAGmn8+0mdWlaT8PC9UMJmVV0JmmCOK6Soc2CF4iI9cS1kg71zgxDmNj
         4ATM97x4xwnHm4l2P4obI++t7B89o2i23hjwUKxi8qkQnYXocVDn+QxsF+1eazyfMFZM
         bGjw==
X-Gm-Message-State: AO0yUKVWeThOc2d1nQ4656NBZWbhd8QMorR1cxU8T0XbDpgY/wobZLat
	v9WLUKWv7mXjX53qZXuiIanYO3g6rYsI5KR1MLg=
X-Google-Smtp-Source: AK7set/5KdZbA6hPjRJxJIk6pPmPLbIG/PEZE74cY8csx7Ody/+pmRZuhtGUWixg3VDUMHHJ8swa8A==
X-Received: by 2002:a17:90a:4b88:b0:219:f970:5119 with SMTP id i8-20020a17090a4b8800b00219f9705119mr1022118pjh.1.1674766852256;
        Thu, 26 Jan 2023 13:00:52 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:cb5e:1d39:8f45:c450])
        by smtp.gmail.com with ESMTPSA id nm16-20020a17090b19d000b0022c0622cc16sm3783971pjb.54.2023.01.26.13.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 13:00:51 -0800 (PST)
Date: Thu, 26 Jan 2023 13:00:45 -0800
From: Benson Leung <bleung@google.com>
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	bleung@chromium.org, heikki.krogerus@linux.intel.com,
	Daisuke Nojiri <dnojiri@chromium.org>,
	"Dustin L. Howett" <dustin@howett.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: Re: [PATCH 1/2] platform/chrome: cros_ec: Add VDM attention headers
Message-ID: <Y9Lp/T5RezpCQ5Zx@google.com>
References: <20230126205620.3714994-1-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+Hc6okv4I9ucYZvU"
Content-Disposition: inline
In-Reply-To: <20230126205620.3714994-1-pmalani@chromium.org>


--+Hc6okv4I9ucYZvU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Prashant,

On Thu, Jan 26, 2023 at 08:55:45PM +0000, Prashant Malani wrote:
> Incorporate updates to the EC headers to support the retrieval of VDM
> Attention messages from port partners. These headers are already present
> in the ChromeOS EC codebase. [1]
>=20
> [1] https://source.chromium.org/chromium/chromiumos/platform/ec/+/main:in=
clude/ec_commands.h
>=20
> Signed-off-by: Prashant Malani <pmalani@chromium.org>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  include/linux/platform_data/cros_ec_commands.h | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>=20
> diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/lin=
ux/platform_data/cros_ec_commands.h
> index b9c4a3964247..ec327638c6eb 100644
> --- a/include/linux/platform_data/cros_ec_commands.h
> +++ b/include/linux/platform_data/cros_ec_commands.h
> @@ -5862,6 +5862,7 @@ enum tcpc_cc_polarity {
>  #define PD_STATUS_EVENT_MUX_1_SET_DONE		BIT(5)
>  #define PD_STATUS_EVENT_VDM_REQ_REPLY		BIT(6)
>  #define PD_STATUS_EVENT_VDM_REQ_FAILED		BIT(7)
> +#define PD_STATUS_EVENT_VDM_ATTENTION			BIT(8)
> =20
>  struct ec_params_typec_status {
>  	uint8_t port;
> @@ -5906,7 +5907,8 @@ struct ec_response_typec_status {
>  } __ec_align1;
> =20
>  /*
> - * Gather the response to the most recent VDM REQ from the AP
> + * Gather the response to the most recent VDM REQ from the AP, as well
> + * as popping the oldest VDM:Attention from the DPM queue
>   */
>  #define EC_CMD_TYPEC_VDM_RESPONSE 0x013C
> =20
> @@ -5919,10 +5921,18 @@ struct ec_response_typec_vdm_response {
>  	uint8_t vdm_data_objects;
>  	/* Partner to address - see enum typec_partner_type */
>  	uint8_t partner_type;
> -	/* Reserved */
> -	uint16_t reserved;
> +	/* enum ec_status describing VDM response */
> +	uint16_t vdm_response_err;
>  	/* VDM data, including VDM header */
>  	uint32_t vdm_response[VDO_MAX_SIZE];
> +	/* Number of 32-bit Attention fields filled in */
> +	uint8_t vdm_attention_objects;
> +	/* Number of remaining messages to consume */
> +	uint8_t vdm_attention_left;
> +	/* Reserved */
> +	uint16_t reserved1;
> +	/* VDM:Attention contents */
> +	uint32_t vdm_attention[2];
>  } __ec_align1;
> =20
>  #undef VDO_MAX_SIZE
> --=20
> 2.39.1.456.gfc5497dd1b-goog
>=20

--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org

--+Hc6okv4I9ucYZvU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCY9Lp/QAKCRBzbaomhzOw
wkAbAQCX71yLAbLh1OxBZwN3ogdzQ1kJauzB/zib0YK6R3LZZQD9EIRAl7YEcjAo
h+vhn3rZ1HljmiVxXvePEHEJwQWnFQo=
=ulQ7
-----END PGP SIGNATURE-----

--+Hc6okv4I9ucYZvU--
