Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5CD207677
	for <chrome-platform@lists.linux.dev>; Tue, 18 Mar 2025 11:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742297275; cv=none; b=kt9J2sGeD1DzWhFBBZS6Goumrz5vxv9UPuDp70hc0+yWsh97qTq9FYXG+jgN1dRrFfsRBqa2bQSieSfM4RtDgCg/57z4S+isf7RUV9g0K5RnnMWQb5WZLknO5NTgdcNH9h1+Nkx1PvcmK5ESJ1XWGhr9/77KNaZeUnS3HMA9VcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742297275; c=relaxed/simple;
	bh=1btfEb0nhExcNTi2rYAFFqhfEYGkL8D2ne7lYeiVgz4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nTcNPMuW3Ua4YNmeFzuo2U3gVNBcxP1KDpz+iucoWRERmLK5KPuPxi+oHQnRSD7J2Q2y38q30HhOH0pzFV5RSpZ46XT4XyGLfDmlvuQslA9UVm8Pk3BK6bYvlzVNwYXfUSvCLNNSM8zChOfmDOHU3ju9qGVdGUc2CxtjTFo4ieY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MNZt0amU; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MNZt0amU"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30bee1cb370so59557971fa.1
        for <chrome-platform@lists.linux.dev>; Tue, 18 Mar 2025 04:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742297272; x=1742902072; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zcnl5GlKCMfJmW1p4sjVmtozHXscsIgYow35rf7G1GY=;
        b=MNZt0amUPUxLNrOYpd2AsBLKDVyP9YlbK+bhGoMdvBTMIVCFres0EeVNFeU+jtUO1w
         Pm1T7PzrBQ7vxheaEI0RylwLI+Hvq0jocVjixCY3RfGSPlacmBqEG5qYYCCHXj5hbmkM
         JQ8nq+cTS1ucWiVnCYIjB4PG2o599O5WWXSVlNxMyJGBeFBFtFsLNUSx2llgixqOvTOg
         zH3HS66DT8KY8Gsf5XGOiTQNGfadVs46wMKsune2SbkC3I3JlzW8UssWqvFxTieCK27P
         aS8TPucM3ddiDVEem0w+A2+IXdW6EqN4QjC4SPb4Xx7vcbo0f+VCtIWirlej2krQc1BJ
         F7TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742297272; x=1742902072;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zcnl5GlKCMfJmW1p4sjVmtozHXscsIgYow35rf7G1GY=;
        b=lmxpTJ6XccLSNBLYLbASBUpZiG654Yj6KF3rS+5CcSo3qjqHnm4qpgmKEytnL0gPTk
         nWvxKCqa+tcnbnnJW4EqQ60IHSbMWQ5Ipy+iyaH+pqiYpKspz1XaKjF9wFLqM+Gpg8OY
         Bj5zuvEeL6buyoRiAu7U5ldMXE/eGuf5IJdS7f5XSWOoHgqdKLvQHZkOV1KWYuEWhV1a
         1W0K9ydJ3+1yFINMktnxNcEluvDNl/2JyoNpPoxV7UNGehyTozEGeHzHsjqQBmERkhkv
         KMgxLKJZy0skacML6OK0lDTtoBqqgkvr083RZzUZijB9sv2Fdcu8U8LgG7SwSrlhQz/r
         o/lA==
X-Forwarded-Encrypted: i=1; AJvYcCXfcV7XUUZ3lfU3LL6VKIOswcPzE8oRA9n1T9PBcG67N4P/goitQUhNbWmvH4zEG6mCLKVVJKz3/9OlmCJX1fk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxKGsXsi/xpDb8+B0wsMZ693hVO75/PuUgxw5skOqUzx/MoqmDY
	jakAlHoHOwtczpvALtjov+3Cxraf2NVtSEb6PsxhdWxCpIsjQycc
X-Gm-Gg: ASbGnctCo9crRZIxPa4ah/ErZmaE4yuNJYVsiIDV6Byt0BDZkY7ZdxZrHrNKuA4GP7H
	ZcV2OTyzmWU9hYKtnNSHSg5dA5SN1RmuLvipPmhV5RSJEzo19vKfvBZTKGjCUOMv4t+EV3HAgzE
	WnbPvu28v2dC9shqgGyneBq/YPyRe99NTA8h4rOfkM0Y0JRrA2L6+vEL6d9LGq/N5f31/igePlF
	h/Nz9ujUK8O95r/lGSCN68e6kwiEsMcENsAxdIJDYNEGtlM+ty1StQr1TeEnhPytg+xNAcucUQY
	zTI3W9s071eVAkAQEWx1fvigtOA6aR5P5jTHkFJL/1lO3XerMXfxf0NAjg==
X-Google-Smtp-Source: AGHT+IEvZc01ulZSub0QgeTOuwAOi7z7tliPNhgrvh4e5mEa0+pNv/UfnHT4a0tcm+JYufa1tEjSnQ==
X-Received: by 2002:a2e:a9a6:0:b0:30b:ca48:108e with SMTP id 38308e7fff4ca-30c4a74da96mr99734661fa.5.1742297271619;
        Tue, 18 Mar 2025 04:27:51 -0700 (PDT)
Received: from [172.16.183.207] ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0e9990sm19630921fa.26.2025.03.18.04.27.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 04:27:51 -0700 (PDT)
Message-ID: <50205854-b8fc-4022-8a07-ec36d8203f87@gmail.com>
Date: Tue, 18 Mar 2025 13:27:50 +0200
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/7] Documentation: Add sysfs documentation for PSCRR
 reboot reason tracking
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Sebastian Reichel <sre@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, kernel@pengutronix.de,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 linux-pm@vger.kernel.org, =?UTF-8?Q?S=C3=B8ren_Andersen?= <san@skov.dk>,
 Guenter Roeck <groeck@chromium.org>, Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>, chrome-platform@lists.linux.dev
References: <20250318094716.3053546-1-o.rempel@pengutronix.de>
 <20250318094716.3053546-8-o.rempel@pengutronix.de>
 <cda899c6-4330-465c-80b2-63c9da73505b@gmail.com>
 <Z9lYA9yUx62wNISq@pengutronix.de>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <Z9lYA9yUx62wNISq@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/03/2025 13:24, Oleksij Rempel wrote:
> On Tue, Mar 18, 2025 at 01:17:38PM +0200, Matti Vaittinen wrote:
>> On 18/03/2025 11:47, Oleksij Rempel wrote:

>> A side note which you can consider if you feel like:
>> This, as far as I understand, will also make the ABI out of this. So,
>> perhaps there should be comments in enum psc_reason and the defines in
>> Defined in 'include/linux/reboot.h' that they are part of an ABI, and must
>> not be changed? I suppose user-space tools may get unhappy if these values
>> change between the kernel versions.
> 
> Yes, there is already: "Importantly, the order of these values **must
> remain stable**, as bootloaders, user-space tools, or post-mortem
> investigation utilities may rely on their numerical representation for
> consistent behavior." :)

Just noticed this. My bad, I did reviewing in wrong order :)

>>
>> Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>
>>
>> Yours,
>> 	-- Matti
>>
>>
> 

