Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFEA23BD05
	for <chrome-platform@lists.linux.dev>; Mon,  8 Jun 2026 00:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780878342; cv=none; b=TQP0G5uSSQho6logdoRFNKhdE6LErFkrqwORn9G949MqQDWDFaXawOHTLWzmO3DGJuigXLMjPqJk7f1K6WMmsDtVc9otrzHnTRfswzuNG+7GbWig1jYBCoe9WMjHbl5BQ8QPU4uX3TPUoj/OsLB5DiIJyZAKCO/CkblhLspBfso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780878342; c=relaxed/simple;
	bh=ECmitdEydk7PfFA+T11X3E2TOA9POkpKjgNGjZ4Bt6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zza7q1tjXScEgFyTfPTi/SNhUCwlhkqVOUge+7g5BwB1AqrUq/TXDmnzgqK6skON7L9vGoKxzRjDs+/s79BdVpazqVK16d5OyHuymr6mpmphY5zqJHh2M5LTLGcDn05JNKdZOCv6QiqB20sAarleo4NLNaPYOJYGG52FoLQaDv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FdT3uJDp; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FdT3uJDp"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-138129a622dso4790398c88.0
        for <chrome-platform@lists.linux.dev>; Sun, 07 Jun 2026 17:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780878339; x=1781483139; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lBbnG4OA1SFUaywwzjakTJaWMnu6oFLOxfH/aGfZX7A=;
        b=FdT3uJDpQi/AYP5h8ilqKzi18IaqDs0DKmIwHK/tROevPRNOI0N5SRmPISq4xMfybe
         Gd1Zu+nb7wRZq957kGfE97AfuXGdh00Me/t3e2ah0KMVnGwqpdaFMy+DY3yRcpUk+8mV
         ZBJRo+Ur5i0jwRDi9rZ/hWJ/3IwJkwG1A3W/TcmlYl0Vq6tiZy9tGZLu347fChhLiOEO
         wdaKmvNHaEq3bmZ0pKJhJvb/pX784ICH6orVI48oHAr/O93KBHUBlaujeVtxh14coGDq
         OTwS+4dj9XNOJOay4Rmj4wFZ5IQ32UZocktXMUYIXDVqOfJcRvYQPsgLaqiYuo1adrwO
         5vmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780878339; x=1781483139;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lBbnG4OA1SFUaywwzjakTJaWMnu6oFLOxfH/aGfZX7A=;
        b=gmOJILUSDv+v4r5IYo8tMVXzTCTC63NVmRDQpKWVdrw//BU49QrtN7eJtA0lc4didK
         rZTrnSGhGKTE3wGZHYeSbGwX7/Kch+DdK7Y/WxLKM/62yx89q1Pq3HEMT+oc3PRLqZEZ
         xNZlWZVHVB0+Lq7mBzPns3IOMpUdIzX9MUVte56GEuiEzmJapOasT+YNxDfbuMNLqx1v
         F346brQ8L9SRfyllrIQDPr1OzYiEgHFkNbopF14R+4apaGJCJjn8uk8+meZjqnJkGH5c
         6BxAXGtqDwsHDszeuF837APEQ+3rtJaaG5QfR1r2PVVcbhQmVYqCEZsqMf7uz3MYSvSR
         CjmA==
X-Forwarded-Encrypted: i=1; AFNElJ9u+iq1xYnuYGZ9wDRxvsraNlw25SSmg5u0bKITodsc0uzYR9XOzcoRu6p09Umz8kpHEelFJq/cHR0o114FTUI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyfAhwgwH0vCNPOTIKsXd5JWuSbTkzX3k+k4GEfzzZ40QcGvtVd
	8FWHa/QLeAyjRrnDH8DTC7w4ewg7RMO9II5IThZnGWrdydOMfF8/xF/r
X-Gm-Gg: Acq92OEM2//YbIQnY5SnE1Z3awEdIHoiqBept2rpQnlVMSnKkbK2gKtSC8igyAltmJC
	BgwZgDIWg1MPVnD/xesFcybj+epJGbDYgc3uHLn0Uw2BKscEkLWtTtf0lGQK++P1iRCxe+LL5Aq
	wqsdWuxN3qu47NalA8P6mL3UCes9Pi45TrFtpXCy86exI0fkH9BpAO5Iq7TSMhBkW0kvCZhWseK
	8KTzF0XDniqqGGi2fq4ZT4xM3ARHNrS3PI3hS2VLhDB4HKidTAB2MXJGDwyDPHwY5doj3y2FABe
	4GuarolaUFHAhj2vLqijFYPRfXlpQB+OV6qvIpuwTA4WVUBk62c6dc0RWC9NXyKsb8J058aHCu1
	/2UmTXDYRxJNKjeXx13kOCcBd9r73zK4awgA46EEa9oePQmjNn43vb1RFNYCsFN8YwlNs1FMnTn
	nTYKL5vqVT6PzwvCbnztT7C7UzRnFuE3WKF6nlGY8HabPWSpY=
X-Received: by 2002:a05:7300:320c:b0:2ed:6f94:9d9f with SMTP id 5a478bee46e88-3077b2e0c15mr7274403eec.11.1780878339457;
        Sun, 07 Jun 2026 17:25:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db528dcsm18069989eec.3.2026.06.07.17.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 17:25:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 7 Jun 2026 17:25:38 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Benson Leung <bleung@chromium.org>, chrome-platform@lists.linux.dev,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] hwmon: cros_ec: Drop unused assignment of
 platform_device_id driver data
Message-ID: <fdc7befa-1bd3-4689-ac20-2691bc202cca@roeck-us.net>
References: <cover.1779894738.git.u.kleine-koenig@baylibre.com>
 <972c9998054c7944f63266819d6fb08b36edb5c5.1779894738.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <972c9998054c7944f63266819d6fb08b36edb5c5.1779894738.git.u.kleine-koenig@baylibre.com>

On Wed, May 27, 2026 at 05:15:52PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> The driver explicitly set the .driver_data member of struct
> platform_device_id to zero without relying on that value. Drop this
> unused assignments.
> 
> While touching this array unify spacing and use named initializers for
> .name.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
> Acked-by: Thomas Weißschuh <linux@weissschuh.net>

Applied.

Thanks,
Guenter
