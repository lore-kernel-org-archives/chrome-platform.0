Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2F43EF650
	for <chrome-platform@lists.linux.dev>; Tue,  5 May 2026 15:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777995290; cv=none; b=TeYEyoQNYhWWfbxuRvP0LTWkwMQjPC4xS7+/Hsv/c7t6U9oqxxDPHReAViVPTjAfjN//8sb74Kps223wRfhbKg/BAeWmaZC4SsYA6WFfYv9dUf9J5KuNTOSI3PI7WIlHDDwGOlX2tsK1Liq6rYZhuY6PYjI4mLlb/gf7MaT23pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777995290; c=relaxed/simple;
	bh=g50FWd240XxxeHR0wZZltMJw7SH0rpOeuhOkFOG+fy4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=PZgYyHfwmCj4CWLFvxqRO2LmMGm+88lYUOWfRmXWhMfImvpTqNdA12YOo02+TfgRInq2jggcS4SQg2YDJ8iQuADwzz6C9/MGpVWu2xwiPhjaAaQjKWDC/TtztRznj1qKC5bHhwa+fyaBKWIMiVIAuqK5DMR90xjlkhN5YxHezMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=QjgcqCQP; arc=none smtp.client-ip=209.85.216.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="QjgcqCQP"
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-364ff382b0bso4208531a91.2
        for <chrome-platform@lists.linux.dev>; Tue, 05 May 2026 08:34:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777995287; x=1778600087;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kA0xbWBKz7CEhEmimLuZzTtRlEkl5OY8Zl0ZAfchvHM=;
        b=CeV4QL4E6rRfp1w7yutfRs1ZX8D8t6eYZ+wqFZMEyXMcLL+4BQUwa+HG3jgyuP2uEl
         yMLiuXpYVpbQGF1wkKawx/HZcEjOzcjg1F60o6xYM3s3Vsh4PAs4+MBEEtfEkGunTpVG
         d58JQYmeJNZEGjOenhKnGvLxVQ83DwI4raWY6jfi5727Mjtf36tSqQpTJAOqrnZaleHB
         MTxoB82ByGea+7KiJ739YdVPL5sDyz79r+D+a5NbqUtDW4rcFOCRk61axGmjLruXutvj
         cesVitQZN2j24U+Ia0ZmpTatfQ5D2sEXuBv6uAsJwg+J+nTlaDuGUizM5rfYWO6tAYlR
         ctrA==
X-Forwarded-Encrypted: i=1; AFNElJ+qpA0gtSBlt0fnm70VWnK5i3xRMHp26LUQWtuTFJtIMs2A7vZP/n4o4cXmXGRYb4Hoqb55/l0Z3J9xHLihgrE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzs4TXY2cx8Ij/KH+/Eaf3Kf/+RUYSBkiXWpmmm3mMtL/Q/icwk
	bwhmU0tR78Rbju4keG9RzRMoW1svDogMOMQokt/cswAciiId19j6oG6L7Z1a3knlEM/36TcR0hN
	/mXMKn6zHL6wyB6N4TrYpdehacDXpZ/NFkMcZO9anKrrEAZt9caP43+vycump0lqoLZzYqHuZPK
	GPYAnkCFtoYWIeOifQ1AEhzBRkrz5x/ZjU1Dm/fmZeOtys5p06SmL9ebdEYlVZoIqXwgogyt184
	DcsuF3IV3S7dO1THLq1OJsjoTvR
X-Gm-Gg: AeBDietyqTJIs+BbemfrjJFr5rPeGQjQ3rKRaofdqP8ErMUL2TMPLgYCVPWHYEG5uJT
	oXUR//Og3M+0gmSg4pEHNYT1OhnYhChunu5eqt1JzrotY0oKP4T+bmy6TYR84iWp342NAEEGyrq
	qPOJqYQIqSf1pcSveooJUPcNtP6ET9EO8QtZ3Mb1zoNaZcv9QhovFj/oAsqrrQ7WnzZ+FiRwZlR
	AAzeBen7kAbAzm5v8kmljcQ6YXecWG6cfDzg0Eyp2wpeabbVf4H8pjTlhdgoF3MNnaRgtOWxhDC
	bXZ/eHUY77qo7vuKassHdXPQM3TUSIKvpeuyuljQB2eiybi/6dYMw6r1TmGvMXal3dFXLlMwFNw
	aOlMItLGHxReP7GqsK72mkz9ZG1u4lOW9oi5dMXsS0ybS3Hxl0gbH6jInMy2cT4/ABB3eQzrDP6
	WC1rmdrlzlYXd3CfAZb3uZ
X-Received: by 2002:a17:90b:5707:b0:35b:b52d:f34d with SMTP id 98e67ed59e1d1-3650cd85e4amr14074305a91.5.1777995287481;
        Tue, 05 May 2026 08:34:47 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com ([144.49.247.127])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2b9cab67ce6sm8938775ad.35.2026.05.05.08.34.46
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 May 2026 08:34:47 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2c16233ee11so7115262eec.1
        for <chrome-platform@lists.linux.dev>; Tue, 05 May 2026 08:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1777995285; x=1778600085; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kA0xbWBKz7CEhEmimLuZzTtRlEkl5OY8Zl0ZAfchvHM=;
        b=QjgcqCQPc4PQB9gaDir1Rf8R2/CGXR4wrd48IiH+5ELryRyYv902Rz2KmrzgzEBRuJ
         GqAu+XfQr3AnZgRfAAAX8hYP8cYGxcv0QXFUd9LLO3he1yQyK2NsugF87srpcjAO3cLZ
         L/QMCYCnDM9od/xwNKgTWR1ps04glzUGnqgvo=
X-Forwarded-Encrypted: i=1; AFNElJ++6GPkP2jwOkjAz8feu/ogycRVeSdEYnSHqsXDgKLtFmAtir0gUgcCw544n3D7ePAtp7ZEYJYtkrvXiftIts0=@lists.linux.dev
X-Received: by 2002:a05:7301:1001:b0:2dd:2d70:8aba with SMTP id 5a478bee46e88-2efb78d70ccmr6578844eec.4.1777995285440;
        Tue, 05 May 2026 08:34:45 -0700 (PDT)
X-Received: by 2002:a05:7301:1001:b0:2dd:2d70:8aba with SMTP id 5a478bee46e88-2efb78d70ccmr6578827eec.4.1777995284858;
        Tue, 05 May 2026 08:34:44 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3bc6a79esm24306770eec.26.2026.05.05.08.34.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 08:34:43 -0700 (PDT)
Message-ID: <8f1380f4-6ef8-4fc8-b72e-4df7b6b3cbad@broadcom.com>
Date: Tue, 5 May 2026 08:34:41 -0700
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: Move MODULE_DEVICE_TABLE next to the table itself
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 William Zhang <william.zhang@broadcom.com>,
 Anand Gore <anand.gore@broadcom.com>, Kursad Oney
 <kursad.oney@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
References: <20260505102846.186219-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20260505102846.186219-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 5/5/26 03:28, 'Krzysztof Kozlowski' via BCM-KERNEL-FEEDBACK-LIST,PDL 
wrote:
> By convention MODULE_DEVICE_TABLE() immediately follows the ID table it
> exports, because this is easier to read and verify.  It also makes more
> sense since #ifdef for ACPI or OF could hide both of them.
> 
> Most of the privers already have this correctly placed, so adjust
> the missing ones.  No functional impact.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   drivers/leds/blink/leds-bcm63138.c | 2 +-

For the above:

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
