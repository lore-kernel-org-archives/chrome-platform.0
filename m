Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2D77081D
	for <chrome-platform@lists.linux.dev>; Wed, 13 Nov 2024 03:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731467161; cv=none; b=F8+a89sadli+lkjJmmcDPuf4VtgiCbb5/K2swojnriU8qG5nEUZsgRAtdvuqiHZB5vTe6XXpg7zaY4XTtZcjVPzod+PJOWGAcyR2nclIh1whBGwwss+WeHLGGA6jah5zPuMGTK+3CIw1YIiiPUGsW8TI0gLWVUTGzRKVY4+4U6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731467161; c=relaxed/simple;
	bh=jgeKZMmVVEHeeeEKCLCb1OdnvvKeX/iz32OKz04+v8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nep+EB+EcvEVTF1VkRcykCjGBcN/qf3Z1/zaCqS8FMXRrFalmYFXWScOBfuDCj0AgdkHZ1c48JcYV47H05Dbkk2DaVmdZ9pKBEt2K+hBAzOl7urX9VNSig5xavGCY+PBoVMnjlvE40yIc2fDYQ7eAjCBjx82mcSc7nOeCBwxhxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GdmIlKqD; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GdmIlKqD"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-720b2d8bcd3so5291568b3a.2
        for <chrome-platform@lists.linux.dev>; Tue, 12 Nov 2024 19:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731467159; x=1732071959; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=mGyxITbYswrd6kxCyiPpfT0798sw0dycRR7H9RQ7YQs=;
        b=GdmIlKqDnskcgu+sj77HdaMRwklgFo6XSwIoewI4cXT8dq+h/0VIaCyqVAI4Wg1jA1
         y+mrDQUhErzxYZLnZLS4rJxNW0/wONfpbX0RykwmPSImwneQoxMtcCILOlcLxjLhTHt7
         2aHKABRCSS+PZc3up8uW71ASzLoh6EDl0KYTJFAvuDtbxEMrzx8s9kOx+dgRURedS8cr
         s/jTBVfoM2nW5V4MQoOxM8Z1qU3hIv723ncC7QWoOFikr09+HMO3Y9XHIG0f+Ypp+WMu
         ANI3d9c4ier77kvbprCHToCIS4GBfP3e9TlrKqPvNIPn2+qLD+XXTrJzzigAkqVC0GAb
         4Uvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731467159; x=1732071959;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mGyxITbYswrd6kxCyiPpfT0798sw0dycRR7H9RQ7YQs=;
        b=BcUPcEm/mTXW/3yagz4g/9s57tnYmJy55W17mORmhCWDNulR4zOLtx1JGO7PmK2Zlw
         Kvt07KOSdAczmkdqqBvgqWpaVziOFirsWSyMhwJTS6pIJ8eGZwhNsRnDeUwZa0SlDj+T
         7jSpWq9BsdjxcdFNxcnv9ENkEpSPbgHOBtIq2n5kQRdcq5alyyr0gVtYmeC1h9kmRPUC
         XJ53DNCc5gAkfw7lUPeiceK1AaOORSFwPW6nf3/+PNCGB1DWgAKcFdzgyzwXzdTDsRRW
         Z5sWUwQQ+gmj5UDIsXGI6fkalQPfMTF0XvhTL1uLpp0Au+OexYkbp+03r7ue4frTMhgu
         YXYw==
X-Forwarded-Encrypted: i=1; AJvYcCWbrxs5QkmGQYvvCK210D97d597EGXwmDsHmSfrTVlibUW2jPTZ/o0Hwks1g1vCKUsZlVmbHxdkMa2+vw70Byg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwhPPhuOWvAW6IfgWbj5z9EOgu0u4EAd63hqT7JZ9XbZwE66wQf
	2Tk3viu94ZLQajdIh0iZJmgxlY5wfkh2gG/9ntf3E0jxNkqcXgS1
X-Google-Smtp-Source: AGHT+IEN9o8W+pQFYFSPjfwLZK6aMVXKchC/r/gAKEh+5OaZ0mqzhgqBc0yJ/UNmdm4+vhrQ9gW7qg==
X-Received: by 2002:a05:6a00:3998:b0:71e:b1dc:f229 with SMTP id d2e1a72fcca58-7241334b18emr25460906b3a.19.1731467158513;
        Tue, 12 Nov 2024 19:05:58 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f48d611sm9640849a12.13.2024.11.12.19.05.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 19:05:57 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4efe981f-f7ae-41c7-9c12-2aa3a5d2d046@roeck-us.net>
Date: Tue, 12 Nov 2024 19:05:51 -0800
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] dt-bindings: mfd: Add properties for thermal
 sensor cells
To: "Sung-Chi, Li" <lschyi@chromium.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
 <thomas@weissschuh.net>, Jean Delvare <jdelvare@suse.com>,
 devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20241111074904.1059268-1-lschyi@chromium.org>
 <20241113024000.3327161-1-lschyi@chromium.org>
 <20241113024000.3327161-2-lschyi@chromium.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241113024000.3327161-2-lschyi@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/24 18:39, Sung-Chi, Li wrote:
> The cros_ec supports reading thermal values from thermal sensors
> connect to it. Add the property '#thermal-sensor-cells' bindings, such
> that thermal framework can recognize cros_ec as a valid thermal device.
> 
> Signed-off-by: Sung-Chi, Li <lschyi@chromium.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>   Changes in v2:
>     - Add changes for DTS binding.
>   Changes in v3:
>     - Remove unneeded Change-Id tag in commit message.
> ---

I can't apply this one (not in hwmon space), so

Acked-by: Guenter Roeck <linux@roeck-us.net>

with the assumption that Lee will pick it up.

Thanks,
Guenter

>   Documentation/devicetree/bindings/mfd/google,cros-ec.yaml | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> index aac8819bd00b..c7d63e3aacd2 100644
> --- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> +++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> @@ -96,6 +96,9 @@ properties:
>     '#gpio-cells':
>       const: 2
>   
> +  '#thermal-sensor-cells':
> +    const: 1
> +
>     gpio-controller: true
>   
>     typec:

