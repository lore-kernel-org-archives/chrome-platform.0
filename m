Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9AC424679
	for <chrome-platform@lists.linux.dev>; Tue, 22 Sep 2026 09:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790068333; cv=none; b=m7/CpXIMvhjYS+tkA6B27F3eYfoN+giobr7TcZaFiZqqpF1uFpTv9D7yWA4GoFLp0CKztitDFNkH4Sptl5QNfOj+nuYKKX/bIhteLdkhXaTUy016wibrp6iqcD2RnNnJc+rfwKzklRm22uexe6N+Khsl+FJZhG+HJ6x8pCXnmnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790068333; c=relaxed/simple;
	bh=fQgPBD9Kek9DVD06+pbQVN0+3t7b55JwSdnBbCBPOqc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P+vViu5bAsWalauni8w2xc+k0pUkc6FDkwqCJ1b3CiNhkdtSvVFHoATpc1PHjyxtU3GrEzbmYVVOl5aX7pyG9i8Vqz9ZoQijTmTZsIRZrsC4xNc+81SljxucBdD35zvEo5P3sS8oPTASfehYTaUWkaEH46YK+nXMfMbIz6NcVqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O/aHg2Dw; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O/aHg2Dw"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b74e0c2e4dso3511276e87.0
        for <chrome-platform@lists.linux.dev>; Tue, 22 Sep 2026 02:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790068327; x=1790673127; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cDbclgIWO4R8bDcAGU87sYhseS50l+4Py8e7acKbvhM=;
        b=O/aHg2DwwwmJ/55k5HI696EZ3JfJRSezX+dYpnCHKihr08nYBws+xI+wT9VlGPdK2C
         6fyPMyrUWvxNkZzEMUGONW6eaNCG21yLtMyQwDzJ/sPMatotMYuaFX7xDKPgQgwP4ae0
         bYO1wQDaT2I+mhoNay5iT4/ivGL7+4r7904w/Jc6HHGjReWX9Km28/AgLmGDRqH6I4vn
         ZppoN4YDWbuqKqxV9amdz+0kmqTbCUmuRcvOtxdRzuqqBGhIZmC08xlcV7N16SY5k4Ty
         UAHFc68e8Lu4G6kHxi8VbXj/pXq4kQcI08XVUFoZ3NETr2UiLfjoNwzfrdeHpF7g2Y1b
         g/QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790068327; x=1790673127;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cDbclgIWO4R8bDcAGU87sYhseS50l+4Py8e7acKbvhM=;
        b=RgHTMaOP110i5q72tXCGOU0XWTf4DtpyJbo3FGcmm6iZoz9yDGFqg7WWhIU9UdndAl
         ukJu5seTX0pkUnVcYsCujig0aZwmzJ/6WeoJee9XaC0xOCxW2hsGhaNVDRpC6w9XfFzC
         whbsm+STzqDeQFbteTNwMrSuw9Csz8C8WicZlMdVbI9+kGwPOH6HkN1C41FmdFFqmpzf
         cZf6g1zZiohJmF0TIrH/6w1jiW+e39NK4lT4WygPkGhJ/1zqWVhYxcBKRqDHF5h496gT
         HYg0SPYqC9KOxCzZZyptJTLKxBpANeCu40ue6/vOQNkc4Vzpsww2dP56GC9cfgTMRjlU
         x+OA==
X-Forwarded-Encrypted: i=1; AKwUvBytwJntPI85h2I0axdRMxuvT7u25yKrJtsjAne6ybNvkHa3n0uiUrUgkpb8QwBCM6PknOhhf+IxGkUau/TU76Q=@lists.linux.dev
X-Gm-Message-State: AFuF++lzz7j0/0ncuRVDEO+rczD34zFeODVWrqfMdpBbG6ZAlK+iH6V/
	M/sD1bbmikjanWzbUuP0t9FPAouXYiF8gPEnUe7j8JkucqMrfMcV8U0i
X-Gm-Gg: AYBFou39NkvM4SKukoD9SsSgSY8fMILLt3u39nA4EUS4wI2V1rzxP0qCj9QO0mjQtyc
	9I6Braf/3DjUaZWEsNHQLoZJcwcnh5GvtTs9jQhcuIO/R1wYOLdDqA4u3KGDJKKfst564HgH3Ur
	GmAjA6oi9+xu2CNKNSEYdvERTq/WgB8S8grMecSaOKz/60kAsqApGk7ttSWm13oryf/dpxq2lxY
	4XFbQwO/NcLdDk31KDpzO7C2T+xk2fOoJSFt4iGySyCvCNPz0FlADYWgYz9n8XEk5wfvzde6GQv
	E4UMg+zcOudwA7JmjCHn8tD+hC94GIep2ckXBmJRBRx6hlsw0n02lvTbQAFyFAf5SYRyANKTGVL
	udsxMJrHCZKbyItp+LIQEmdmJlSwtAmV9qi+FfTyjgAkT0wIo85ALgBXFPBz1tDm3HB38Uo9P1R
	03+NTo9xvPgHn3mKJ/ivuI+uJtsl3GuqkTrQ3vY1QjCnDqn0FcdhSG7Abxa+JwbmR4d83Dmn71i
	D1IrFmT5DpHWnhoftWw9VqNql2g6p1Sp5UCC8c7wvuqkLEarVzpUBw=
X-Received: by 2002:a05:6512:3ca0:b0:5b6:423:9fa7 with SMTP id 2adb3069b0e04-5b8c1845600mr4360136e87.31.1790068326297;
        Tue, 22 Sep 2026 02:12:06 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d46d1e0esm317726e87.20.2026.09.22.02.12.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 02:12:05 -0700 (PDT)
Message-ID: <822bdb90-185d-4b2c-962e-5f487c112b27@gmail.com>
Date: Tue, 22 Sep 2026 12:12:04 +0300
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 6/6] Documentation: Add sysfs documentation for PSCRR
To: Faruque Ansari <faruque.ansari@oss.qualcomm.com>,
 Sebastian Reichel <sre@kernel.org>, Benson Leung <bleung@chromium.org>,
 Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Oleksij Rempel <o.rempel@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 avaneesh.dwivedi@oss.qualcomm.com,
 Umang Chheda <umang.chheda@oss.qualcomm.com>
References: <20260921-pscrr-framework-v14-0-a16290003b7c@oss.qualcomm.com>
 <20260921-pscrr-framework-v14-6-a16290003b7c@oss.qualcomm.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20260921-pscrr-framework-v14-6-a16290003b7c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/09/2026 20:44, Faruque Ansari wrote:
> Document the Power State Change Reasons Recording (PSCRR) sysfs interface
> under /sys/kernel/pscrr/: the per-provider directories and their name,
> device, reason, caps, supported_reasons and record_policy attributes,
> including the stable reason token values.
> 
> Co-developed-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>

Good stuff.

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>


-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
