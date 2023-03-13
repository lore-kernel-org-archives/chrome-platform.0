Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9346023A7
	for <chrome-platform@lists.linux.dev>; Mon, 13 Mar 2023 08:47:22 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5F4426603088;
	Mon, 13 Mar 2023 08:47:20 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678697241;
	bh=eiYGAbLT7Zp6mAfdt2dB6CX8x+Pu+9PNn5yycWisyGI=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=i3bpEtmtmzzJmpQtAVv3DD7uBk2oHu7frE/8YBIt0y/rgtFl/hCi9Jh1+hA07vWqu
	 WvE4wdjn5iwtX2p6c/9ufFUFIBQmw8tRwe+G/b+fg1GC9RYk6Wrgj6HQD4aFOjlHrZ
	 nTh+Np6W6Q02+Eo42n0nUTmbSBGVJOgSKR2U/XjVS0eouPibXurU+VZqFvyDungmFP
	 nz9i1YEcyErO8WiezxSAEKuMSM8ZH39yyuLVkP8riqALdNuC+docyQ/fnBPXhsUh4w
	 RJI/rYjUva3ERdXA32dY7t/wFDsBTajf8aTk4ij8G5zsV6QTB7vcEO0wec2EWFka0X
	 SQFineRDdXXkA==
Message-ID: <2dea693c-39f4-c226-4234-36f1bcb7c0ba@collabora.com>
Date: Mon, 13 Mar 2023 09:47:17 +0100
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/5] i2c: mt65xx: drop of_match_ptr for ID table
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Qii Wang <qii.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>, linux-i2c@vger.kernel.org,
 chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-actions@lists.infradead.org
References: <20230311111658.251951-1-krzysztof.kozlowski@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230311111658.251951-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 11/03/23 12:16, Krzysztof Kozlowski ha scritto:
> The driver can match only via the DT table so the table should be always
> used and the of_match_ptr does not have any sense (this also allows ACPI
> matching via PRP0001, even though it might not be relevant here).
> 
>    drivers/i2c/busses/i2c-mt65xx.c:514:34: error: ‘mtk_i2c_of_match’ defined but not used [-Werror=unused-const-variable=]
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


