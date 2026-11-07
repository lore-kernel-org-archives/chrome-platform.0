Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794095619;
	b=CBHaT/sZvc3i5PqNZcCVxFG1yKM45ExyHb//rSPOXWAXQ4+kvgn3CZL0WokBCOm9PwgJ
	 BG56DUWFwju9h+3B1qMFZ28d0x7Envk9WpwU1FKGHMhfhy9S6T/fuJDWjCaWXl6HvW9Qz
	 MzRzb1LcToYE/ESMmsm/JzOMt0pIWW55xULQ317rNo5/+N0tJl08KygZFEY4S/yYzTssj
	 QzvW/ky8PlNbqVr1gZyTFnjFT3GEeMsSV7Cy+Z2hNijde40FKJdNBX8QLTzwa3yd+a57/
	 yo/FvtCQH4F2vqSv+yTvvWffs0ezWyJ7brsSYo8dAp22USnJdWvQj6CX9v0NYSZm4xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794095619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=KHl7FjLAzlF40pqV1aBsWmS/0qukI7VrjXFs4bBB8lA=;
	b=ebFIR7Ae/kf1vPr5vmQyo2JeWwYXceLrV+UA/hesAvbfkf7aBIjmCDtgP0GmYYCW2CY2
	 tZ/ky8PLvBEAbub+GBc30WaGYpRQ/fqBx9wrDhRCZpAzLBogV/cqWFYopaVro7LDEaWgN
	 XgX0CzfCGRzrOdWkTRT0MpNa2b+YjojRAK88JGfdG3WjdqxTAleg2bZSePzOeETmcWtab
	 D6UYdYFO6J/4dwsGZLfTp/Gn1DqexKfsARINX4tbwHUtou3/Edkis0i1mFwOQLbvFGgQl
	 FtBICtEnkmp8D7/rs4HoRctaJtJi4vcU2w+vV2u11t0NWBqOV0l3+z+5oyLp0G7gCGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fgQeD+Bh;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C59606A32F
	for <chrome-platform@lists.linux.dev>; Sat,  7 Nov 2026 23:53:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54C59606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fgQeD+Bh
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ed08b07213so228945ad.2
        for <chrome-platform@lists.linux.dev>; Sat, 07 Nov 2026 15:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794095619; x=1794700419; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KHl7FjLAzlF40pqV1aBsWmS/0qukI7VrjXFs4bBB8lA=;
        b=fgQeD+BhRGCtdsyplsc9KPp1tB0MFo6Wdkhkylv57IJyK/kmuV5JcqwpL2NfDKMtFj
         V42ctYKeLQLciS+Q/hqy7WumchEsf6NXJXhVVo7Pju21zcNjk1wRJ5aMhd60Z+b/5KMN
         4JG/kj5RtJFH2UTCvrPOLvIzJ59xIPpLAyE4wxt8k86Decu7miSkHtp9ZSZUdqL0CDhK
         xHKsu9oFZQaH3D42mBZpYJuNOq/6GV8itFmMM3wmU6TDmOSKuBG9Ta7YHXu55N5LvJnb
         0K2AlVxrnj47mjUvJcNKZEPJ1rL81KNURcLeI5qekD5QDmkERdupKW4FKPerC1LBv/pF
         nMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794095619; x=1794700419;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KHl7FjLAzlF40pqV1aBsWmS/0qukI7VrjXFs4bBB8lA=;
        b=Bq7IOI3f8ADb5QgIlXF21l0oNDlLGIrlcRftcsB3Mrdfx24jE2EG5e6EGDA7vAG0W4
         HBIAKjZajsAC8v7T4kpeYHxaInC3qRIInWH7DvR6RN6pEZFy+n6dW0WmegQtK822qGdc
         aJ2XA3NnXBM9bp4SIgCHpIWtLJmTs+ZX+lailxuo+ewNMFX9HVKulWq1v8+F514iuVy2
         7PhvCFaNoKKThrBRCE1NWpXlpNvBjXdIHbL2dEyH/7LAcHr1AJhfNfWMWuWMqwJAkW5A
         8Sui7XgpJ9SVDoN4rw3lNrzup1j+aH/ZXKsDWEf3B0W69YHMwKVg1L1e7lRG2DPrjq9+
         9+kg==
X-Forwarded-Encrypted: i=1; AL+hErFFYk+pMykm3gK9YONbwYZXP0lbK4e6yHV5ob6eLF4Ba+ZF00aEpiLhBk7lLN2WCcwWYW0k8/Rzg5jLacZ/n/M=@lists.linux.dev
X-Gm-Message-State: APuU4Z/DAd5DOPSzz1MFcapp1hDhC3eF+/8xQaJreVMt6IvmB0bTfAiN
	kYfK7brCGofK6HJz8EJO6Vp+SJ03YFpvhPIHnzkjqvRt5T1TKqw9RCmJ9Rzzh3WAng==
X-Gm-Gg: AYBFou3EUsy/y7w4hqhkq2I9XLveXNGQdHS5RlPB/q0sj/hhVGY+vq7bBHfxi52aMwB
	jApbeinonAl65VxcGfbPt2T2FNcv/Y8ZLwlclZLI+5LsQQ2axeifvd0D+4aaorWLuLMNbPh/tXh
	p+JVlqjOnmg1On50TL6KjACfz/CTq0EzYzzTq2EyszFxd/VtTrMaHUZ2fhjv2m+NxU3jo8CkbzW
	7jqpibadVnbypVH9PCO99BumT6IyK3h8dR8ze8RtuPttSimM7j4pvfhrdX1mPMCDUFqaApkCBMn
	SZsE2SaduTcpxBLO9YGEI2SwdggQwZFzfKvfBJ98JdZA/jRk+krAzDRSFXL4TzDLnh+tQmeEB/S
	xqnqFNNm+bPkrhe0dMnJ+I6LPVazueSZ5Xw7VDRmxMcw5SToEb5w1H25ccwq6fNodgopJ5o8+p5
	44wkXIrWuA+sHfY+M2wlm1C2EC9h4Sw56nF7xqWOh5NYt0Hd2Du7sIN9rBvsvarDIYwqqpUytev
	4jBSP9rMTKnH/cedUkkgQxnrb2mcuvawf4VOlQYEoWZ/14gcwb2RCbFrvAe/9BmKErf2L8qyTcE
	Rkq444FV3GrGGz++ZLmpYV78aLOxBEpzOEt6P9t5V1jLO3UJxJ7rWq+pFhgEblQZEll4U/izEMJ
	gir4MYYBJIN7jf9RF7T74ggqnkcjYbbuNucrDPkPx8wjU+eCEv5k2bzpc93wh1awkoiT7ASZtxk
	CHZ7r9iT3H
X-Received: by 2002:a17:90a:df0d:b0:3ac:a203:e092 with SMTP id 98e67ed59e1d1-3b12d0e72e1mr64263a91.1.1794095617777;
        Sat, 07 Nov 2026 15:53:37 -0800 (PST)
Received: from google.com (196.126.197.35.bc.googleusercontent.com. [35.197.126.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b127712bd7sm678574a91.2.2026.11.07.15.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 15:53:36 -0800 (PST)
Date: Sat, 7 Nov 2026 23:53:33 +0000
From: Benson Leung <bleung@google.com>
To: Daniel Balint <dbalint@google.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Benson Leung <bleung@chromium.org>,
	Lee Jones <lee@kernel.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-iio@vger.kernel.org, chrome-platform@lists.linux.dev,
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] platform/chrome: cros_ec: fix alignment of
 ec_params_pwrmon
Message-ID: <au-5_dDwdf0j7kDi@google.com>
References: <20261106193129.43493-1-dbalint@google.com>
 <20261106193129.43493-2-dbalint@google.com>
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SVqnLzRLk3+00m3z"
Content-Disposition: inline
In-Reply-To: <20261106193129.43493-2-dbalint@google.com>


--SVqnLzRLk3+00m3z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 07:31:15PM +0000, Daniel Balint wrote:
> Sync EC_CMD_PWRMON structure padding with ChromeOS EC firmware by adding
> explicit reserved padding to struct ec_params_pwrmon (2-byte union
> alignment) and struct pwrmon_dump_info (4-byte struct size alignment),
> as __ec_align2 and __ec_align4 expand to __packed in Linux.
>=20
> Fixes: b57af7f8d194 ("platform/chrome: cros_ec: Sync host command header =
with EC")
> Signed-off-by: Daniel Balint <dbalint@google.com>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  include/linux/platform_data/cros_ec_commands.h | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/lin=
ux/platform_data/cros_ec_commands.h
> index a7bd69d83522..6d74371c7074 100644
> --- a/include/linux/platform_data/cros_ec_commands.h
> +++ b/include/linux/platform_data/cros_ec_commands.h
> @@ -6635,6 +6635,7 @@ enum ec_pwrmon_cmd {
> =20
>  struct ec_params_pwrmon {
>  	uint8_t cmd;
> +	uint8_t reserved;
>  	union {
>  		uint16_t set_rate;
>  		uint8_t channel_id;
> @@ -6651,6 +6652,7 @@ struct ec_params_pwrmon {
>  struct pwrmon_dump_info {
>  	uint8_t channel_id;
>  	char channel_name[32];
> +	uint8_t reserved[3];
>  } __ec_align4;
> =20
>  struct ec_response_pwrmon {
> --=20
> 2.56.0.455.g6c5a503b38-goog
>=20

--SVqnLzRLk3+00m3z
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCau+58gAKCRBzbaomhzOw
wupqAQD31+MHMT2GMHa+8gZvTeOGQWK/Ucg+s4hL5AvoDdccuAD9GxQ4UPJP/cxM
xa6kW3kvabTLe+wjpkqkA9kC7jHj2Ao=
=kCAn
-----END PGP SIGNATURE-----

--SVqnLzRLk3+00m3z--
