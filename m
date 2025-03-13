Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90811FBEA3
	for <chrome-platform@lists.linux.dev>; Thu, 13 Mar 2025 07:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741849906; cv=none; b=di6ht9lIgwaq+TvuXsxUmo3wlPOOdKZ/GGXVwLQteMSkRZW+kYdFEZKoZzWtH/KPqRhZF+M+kmlprXoW8sDrdGUyKhtATAhiAuaIpOAA9NblKmlaYkNZ/lSZboSxTRV59LEFTAub6u293EAcx2uIdxVleISUJ3xwX1sLEN/aT+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741849906; c=relaxed/simple;
	bh=gOCEcaOm4eg+X9g2FjfIO3JavsstQR67oggC/rHb/Jg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=krBDKTqPl+g/0X+ulQdspN3ZY3t3/f/5irqnbqzEZOuGJ+knRVYSHrpU8dVT+YE8OC4IHdldbwoyAqGu09Muq+qkx0lmftiKOfasBsEU6OWntQD3TX4kHF1AvXK3uePXAhFTEaBricklrJM3dp8l1034KDlNvuwDHTezOJEews4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UnBQFTW4; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UnBQFTW4"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac250d158a8so7607066b.2
        for <chrome-platform@lists.linux.dev>; Thu, 13 Mar 2025 00:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741849903; x=1742454703; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gOCEcaOm4eg+X9g2FjfIO3JavsstQR67oggC/rHb/Jg=;
        b=UnBQFTW4yC/wTkTHvAUym4Fs0S99QN8EqkaSJ+SDwy3axQggZXwciHIGHT1hPDcFeO
         yAzqiiXJvvBKFUJv6uK4sHHqG2AoqZXxRdU5r8962y9wrKBFaRhHsBoGrGp0aB6KZY5a
         kxsVONla3gKcnnP8kb1l41ZwSBbWQbw4zCIQs9q1NFyziHLEF9cWBEyGSU5CiDh2LNdN
         C8uHcEwKw3qmuVdCijPkIKBBL5SHIs6ZbkE3IoAhPmj4SRoTAg8jQLIe+5vOccp/5yoS
         u3BKMVlFIyk7MVK8gUGrFOT0rVSRQxyTk94zBKTMSa6uGPEapDwIkeztEb9BHLt9ZRA7
         DcWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741849903; x=1742454703;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gOCEcaOm4eg+X9g2FjfIO3JavsstQR67oggC/rHb/Jg=;
        b=SzoUgmq7fmLHAAoSm5fy9DaepShRvpkXqD4Wpu+oL/MFaZo6gy4yR9RSxBSK734zFt
         XJQiuQUNfhkY1JGEWxlzdjhQnvgbltow6WMiMlcm8ysDvsvn8mpv4BVnX0Dcq5808ADU
         1/iSk1SebbgCkdI86AX1mfmntxeCIo+4CM0RymSm79kfCokQySmHS5enC/zHcqNh5wMs
         Yq1OFS/xDfR3zvN4oalWLqbIwp4Ia4CNia3+P6LAFkMMrP1KskkvbKBDCrkBbV89f4SY
         O6GUqpLEU129qeLpXE6E/HvaO/xLfrigOzXWompoQ4cWpGv/Id5kee5qJWRNidWog1X6
         /SPw==
X-Forwarded-Encrypted: i=1; AJvYcCWRuhljaLIz2Jrv7vRaWDpp/nMAXYA1IRTpreICrVT/4q3SldyFCMitZQagAdVJS2cmMN0MkJrsHHyHPnbbrLw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwcMMuFlwKnMv4UfPUCNOwaXweF9vLMA5eOF9+fNZHy4ID4hVN9
	jxzZoWiT38cSeKpHe8KDD9pCTnogR2YiqVpGM+WWfoSUyYKm8ScY4Bd+B2sH1d8=
X-Gm-Gg: ASbGncsqtkfLgHBhpzgVRfgbVrx1TdqPF43gyDoJIojGoaZdum21A5Ym3SxvwHeeL+7
	zsllDQyG6SIl2gg7OQNLaEp7QdBdfOh8ixHp0YELu20zL0Ml6R6/7d0ZH5W06BuEaZvE+Jrmkrm
	juLRke/u0URfxeL6Tw+kyGFkAdPoXkVzy6KLkJA6r8yaHb8E+5IjeimvGdTMh+7V/yCb0c12F4Z
	x5x8GwTsC4lANLVh0N8AijBBJMC7jJ85KvwbpWB5aDVpsa5a5XN0vUV/ONCdVDApop+Ozwadogt
	tNms8E8IwNh4Z8WSeKeTVIopJ3Yxi1vKAy8YQmSiIIVIH3h9qaWHuAFgkduuY9mCEdzU6o/QAg=
	=
X-Google-Smtp-Source: AGHT+IHf+zTLxwilMFVAfGkK4qptdBvl1euTGV3k7WvO0Y7yIjyV+YJp/OXPip+JVtdHHXI0I4Dvxw==
X-Received: by 2002:a17:907:3e8f:b0:abf:7a26:c489 with SMTP id a640c23a62f3a-ac2b9ea164cmr398284566b.9.1741849903224;
        Thu, 13 Mar 2025 00:11:43 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a9dafcsm45512366b.170.2025.03.13.00.11.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 00:11:42 -0700 (PDT)
Message-ID: <52e592c5-7f97-4b7b-bcf1-1bca34c716e1@linaro.org>
Date: Thu, 13 Mar 2025 08:11:40 +0100
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] mfd: cros_ec: Don't add cros_ec_ucsi if it is
 defined in OF or ACPI
To: Jameson Thies <jthies@google.com>, tzungbi@kernel.org,
 ukaszb@chromium.org, bleung@chromium.org, heikki.krogerus@linux.intel.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, groeck@chromium.org,
 swboyd@chromium.org, akuchynski@chromium.org
Cc: devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250312195951.1579682-1-jthies@google.com>
 <20250312195951.1579682-4-jthies@google.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250312195951.1579682-4-jthies@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/03/2025 20:59, Jameson Thies wrote:
> Check for cros_ec_ucsi to be defined in the OF device tree or an ACPI
> node. If it is defined by either OF or ACPI, it does not need to be
> added as a subdevice of cros_ec_dev.

No, it does not have to. You just populate the children and appropriate
devices will be created automatically. None of parent devices should
ever check if the child exist to create a child - it makes no sense.

Best regards,
Krzysztof
