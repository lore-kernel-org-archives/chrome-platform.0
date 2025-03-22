Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58B71F76C2
	for <chrome-platform@lists.linux.dev>; Sat, 22 Mar 2025 14:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742652773; cv=none; b=cnyhHGFRpcUozbGnPO7IdppHJa8wQG0HWJHnYAvv0W4Eg26eJCWya0ppPc9IjPELYOruUee54G89ry23DZaMx8pTUmpe0sP0vbUFNvl65c/QTenpMhIWl9/wUgqh0txfF6X6MM3rr6+0Rac8F/NVREKDpcbAG+4vClwe0xBGPdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742652773; c=relaxed/simple;
	bh=LOiTsFFPNSc7PIhoT2BRyP8c4NN/a85nX48VmpdL2NA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UeuX0UVs0ZUEtRM+9B0Snt5OmyKxLX/F6CDFfpwoVxlwfgx2y6hUglUqBi/YAfCl7/1cXfcyNsrJhreBZXRZ9d8xqoAbhfttbhnl5LAlymu0IysJ4D3ugPOpQopFg7Y9g+coVUpMW97r9lj2Xc4ombJTCNaytuIglQ7KaGFuR8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bPybN74f; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bPybN74f"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ff694d2d4dso4508603a91.0
        for <chrome-platform@lists.linux.dev>; Sat, 22 Mar 2025 07:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742652771; x=1743257571; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=WPvt59i7hYxgU7r3QLrC/YYGvBnSODzzGtR+fmf+F88=;
        b=bPybN74f8Y1yM0nBIl0Bwzo/d3fRkyGRAJdQKYoxWGtnW3+ZrYv04aJPsRlyzXaK3w
         71Jkat9JxWMS4bBtlyRIxYeHtikLf9JwgiTyMMs2mhcHquFzY7oezeQZmTX4lC7k05vH
         jD1iGp9F7jk8ESpy+FyKHa+hckn/BpRPgBQF3z1X3OIipQaf9IsFn5jO4hgy/Tk+9Rre
         q1HIhrRgLfyR5i+V5ki75QdvYjZDbW/6953YXUhh27LhQBge1gvneMQp7+rdKvH20eP5
         0MWj2uEI3rtmGTpuyXWVkrsTmI1/Dtdd4NApnoUsw8ui1bxcoVCvQgH42fnDwrjKAhol
         GEAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742652771; x=1743257571;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WPvt59i7hYxgU7r3QLrC/YYGvBnSODzzGtR+fmf+F88=;
        b=KYe6IB0/1qS8dG6rRKGXFalzN1H5Z8DNFNHT7Nj8poonGWcXvfQrw+s6SqfjpVbcdb
         Y+0lq40EkqR081AWbS5uOSo1k2fiOqPxHTtChXiS2XGCYq4P76m4pwJpZXm7kvOsYQcg
         yhLM6+x+tC4VyHK7RsKrTKlMej0Dd7FGNoIif90JCWr3Ka2EtgBvTxyYhPG0djOu7er4
         hyqVXuSm3Mi2ReXBVnjB6/7O9s4NncwtMjoz9uuBnx6o93Qe7Vw4E0fbyBXA7lwtMmL6
         VAfxyr0I+ORlXU+fkWD8DXjr+JfuyyPtAZHDRI7slcKOnauJUJbrO3U2EhsfDwIqYB+k
         IBww==
X-Forwarded-Encrypted: i=1; AJvYcCVlm7S046Pwc0Vzdphw+zNbaAz2ibUoKTvEI+SiFUrFWmSsYJyQLXSF8vUOBv14nrsxUDmmhbJO6WgwA8uPfmc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxoJM6lp17JDqgnxg1C81JDghNycLDaYspxxd2Bc9yjbk3Dvm9D
	fIcsMuaw/39M2f+jzVbwv6K/jtZVw2dCou3miwgoDwR+2ZiygiBL
X-Gm-Gg: ASbGncur7bN/cFMgTvnMxDA7Uo0JRwxTQS6L5PB++GSnQSirjPmQjI8+Ld7OjSCRqNW
	0wS0PyQRJ9XW5/coPqup9t6L+xjxEPwYKHAdC1pXpwZHrolYmjGCkckF9UCymBGfcv5A52m0/qp
	rqk8reshO8IoviNxtCc7cECJSg58PtkJidZT/gWoNVGveRgMqiJjYjZKJryFSfbtG4/MjU7gQyj
	B2lXeq95xu6tn6JjTApPTYmuKE/hjvUAOZDu0ue0QTv7z7TaLtkEV0Nr8hytqFdJpn5G2Vi7Smt
	j9DHj5Vr/16H+NB6kNw+NxFLqvg5oOa2zf/IucStmfbKxGhp12IsxtfMGnIR9CNLIWcuXQQTsZj
	KirvCo5Xs7X7cUD+gdg==
X-Google-Smtp-Source: AGHT+IHCaPYEji0EcPq2kmr8p09RzVNqZ83CXSetTHZU+JsXQ5x/RM8f2hgYm6bxsfHwVDDOboW/Og==
X-Received: by 2002:a05:6a21:6d9c:b0:1f5:a3e8:64c1 with SMTP id adf61e73a8af0-1fe42c651c2mr12911300637.0.1742652770690;
        Sat, 22 Mar 2025 07:12:50 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73905faa531sm4035521b3a.24.2025.03.22.07.12.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Mar 2025 07:12:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f50221fd-1d76-465b-ba53-62c08c6f8536@roeck-us.net>
Date: Sat, 22 Mar 2025 07:12:48 -0700
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] hwmon: (cros_ec) Add set and get target fan RPM
 function
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@weissschuh.net>,
 Sung-Chi Li <lschyi@chromium.org>
Cc: Jean Delvare <jdelvare@suse.com>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250318-extend_ec_hwmon_fan-v3-1-4c886385861f@chromium.org>
 <e4da28be-66ca-45d3-9ccf-34819460b463@t-8ch.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <e4da28be-66ca-45d3-9ccf-34819460b463@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/22/25 06:55, Thomas Weißschuh wrote:
> On 2025-03-18 15:45:23+0800, Sung-Chi Li wrote:
>> The ChromeOS embedded controller (EC) supports closed loop fan speed
>> control, so add the fan target attribute under hwmon framework, such
>> that kernel can expose reading and specifying the desired fan RPM for
>> fans connected to the EC.
>>
>> When probing the cros_ec hwmon module, we also check the supported
>> command version of setting target fan RPM. This commit implements the
>> version 0 of getting the target fan RPM, which can only read the target
>> RPM of the first fan. This commit also implements the version 1 of
>> setting the target fan RPM to each fan respectively.
>>
>> Signed-off-by: Sung-Chi Li <lschyi@chromium.org>
>> ---
>> ChromeOS embedded controller (EC) supports closed-loop fan control. We
>> anticipate to have the fan related control from the kernel side, so this
>> series register the HWMON_F_TARGET attribute, and implement the read and
>> write function for setting/reading the target fan RPM from the EC side.
> 
> Should it be possible to switch back to automatic control?
> I can't find anything in the hwmon ABI about it.
> And neither in the CrOS EC source.
> 
> Am I missing something?
> 

Not sure I understand the context, but the fan control method is normally
selected with pwmX_enable, which is defined as

                 Fan speed control method:

                 - 0: no fan speed control (i.e. fan at full speed)
                 - 1: manual fan speed control enabled (using `pwmY`)
                 - 2+: automatic fan speed control enabled

Guenter

