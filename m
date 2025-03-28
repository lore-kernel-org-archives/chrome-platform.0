Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259BDE573
	for <chrome-platform@lists.linux.dev>; Fri, 28 Mar 2025 04:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743136915; cv=none; b=nfVVoNhU9Z5B70m3CcmNpANQC37w4y9pIeEwMniBroHuPxVk9Ip+q6p+m+ceCSzeopDIBHYlctIgEUIuD9OloMGC1nOBTShJP15f30EwBdR1pUzu7lAPMtuyTmLd3nyz+iM1nAeHMm88v6angb2ONpW8YzTgLxifmeh3pkz26Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743136915; c=relaxed/simple;
	bh=lgjNZxcRDwmASamYFFnxAYYwYKIpdKj9jeglt+wPP8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=POoq4MpXnseaKuBSaRrtnyoegrsIb4fzLIXLRnfaZAtouyned9CVVmUHgqUE9Z4uQ5wBZ9HsFF/29pwmRAXRjHzwAf/0dSVAoVTo8FbnAWCKA5mH7m0m/j16s08pmV4xa8TqGp61rJxGysMSYKHsE+7rZzpk0ErrVF3IaOP66aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nBs2R4uD; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nBs2R4uD"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22622ddcc35so49614335ad.2
        for <chrome-platform@lists.linux.dev>; Thu, 27 Mar 2025 21:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743136913; x=1743741713; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=8cDzefW9v/a2UVbOEaMdH7r/je/KKOPgsOOsMN3Zz58=;
        b=nBs2R4uDq++m1RQ7eu68OAwx53eh+DDH85opnQDY5DJX5rEV3EI6RWbbbUTXZ4mcxt
         4jkYHSy977niqF70icUtMJmvzfo0wbQQYzij9hkseMl0p7L9wS6ySbEE6ovRnbbkMKlJ
         cg051A3zpwPHlYEaIwYQFGBBPsv/lgefPmXE8Vozg0dkbQ6vzmmIKmqRSOTxCd0wqzlf
         UnGjJS7O5QvWEJvdMvNTlazUA1u+e871xU4qrxu5FE1Auogp1aAVs6vMLjI7gSnzqgZL
         7+pJrqxuiy5xY4hqQOZPVt7wksk4A9E02Mek1/BDXJiOZJXSslKURhYScwBXkh914lq7
         oL6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743136913; x=1743741713;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8cDzefW9v/a2UVbOEaMdH7r/je/KKOPgsOOsMN3Zz58=;
        b=uwm1ot+877mo5xYayYefl84EB3vLE72WBx1c2o4NBEAIZEx+jJdIykG/SFKIiD3Exi
         GqZeC1eCjbhOuSDirWJMviXgt12th63hNoepRpiHYyxp3Z5abcO9LAqU/HrYHBzCxP4o
         7a7Vk4pEG62n+MTZLtVDQ7W1Rsj+jkbzXwpG8EgS5ucsUw48CE3bg3RnJ2ecUwjUuGiY
         FPHan4Lkw7mQ7EU8zN9Z5TXYKXLd1GhfJT8OrFI+CHtT0Rvl4FxhKVi6xLOwB3PtsWc9
         QnpSQ3Hxd3mgL/Uf6zbnh42FiLeEy2wRFR0i8I+9yIYSSfP1s12j6zJvELmT4L6qxSXS
         i4XA==
X-Gm-Message-State: AOJu0YwGOsD+A+O/o3Be7wUTw2uFK3dIm5Yp4QWE8e3S7l22RLXgyWZ4
	N2PP0GDRu7U6S4XR0JFM5HdFiSsJI6kML430G7k/kHHxqhqz9wyI
X-Gm-Gg: ASbGncvA02So5EjbkkLqCHVtpqZ3Ruk9SLYTA0C7T2tQBvQExZQSdA7s+Y5hSwRoJoD
	cHyI1LhHYNtC5uI5jTS1zcSsUNIDMYaKK7spfDM9+fwr1k8G3TNMjTNWAsJcdS+J8AluPrYEoPl
	o+0nG8a+QgYJ4sEVqCleHMBLCfGDNXVEeBF0hjqrsft0+nfTRvLNaQ7BYeGA2h/6ue4ZiULPXta
	cnd3bx30CLkMmZhxRYyWx19wjyGcfexBXxuIPEK5LjuoAUJtsyZUHPjR3mjPOy08G7ZsQ1OvwjQ
	R5PjNDjf/bFmscjIn4xmnUMmCBcLnKHw7jmr1LBF2rWE1PuI6X+GERgy0/3sKjunndrLkCR9vVI
	fTBPpVYniz6pHAQCGhVvRFlxQTyDE
X-Google-Smtp-Source: AGHT+IFUr871gBbcE/ITOJcpUtX31Ab3GbZp4AbSiOfXeGRHHqZwTYc3dshdaDL7cQBzEkE3cXj8kw==
X-Received: by 2002:a05:6a20:430e:b0:1ee:e24d:8fe3 with SMTP id adf61e73a8af0-1fea2d90449mr9947884637.10.1743136913094;
        Thu, 27 Mar 2025 21:41:53 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af93b69b127sm738649a12.17.2025.03.27.21.41.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 21:41:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3f9fcc7d-931b-446a-b36a-1745f650c6cd@roeck-us.net>
Date: Thu, 27 Mar 2025 21:41:50 -0700
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2][next] watchdog: cros-ec: Avoid
 -Wflex-array-member-not-at-end warning
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Lukasz Majczak <lma@chromium.org>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Benson Leung <bleung@chromium.org>,
 Tzung-Bi Shih <tzungbi@kernel.org>
Cc: chrome-platform@lists.linux.dev, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <Z-WG6_uhWsy_FCq3@kspp>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <Z-WG6_uhWsy_FCq3@kspp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/27/25 10:12, Gustavo A. R. Silva wrote:
> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
> getting ready to enable it, globally.
> 
> Use the `DEFINE_RAW_FLEX()` helper for on-stack definitions of
> a flexible structure where the size of the flexible-array member
> is known at compile-time, and refactor the rest of the code,
> accordingly.
> 
> So, with these changes, fix the following warning:
> 
> drivers/watchdog/cros_ec_wdt.c:29:40: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> 
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

