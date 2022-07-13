Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E197A
	for <chrome-platform@lists.linux.dev>; Wed, 13 Jul 2022 08:16:38 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CE96A6601A33;
	Wed, 13 Jul 2022 09:16:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657700197;
	bh=R2PxcQlGqCPfLT0tv7PApqY13Oo+XyU+FcKDR3vX5yw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SrFsjNOdbmRGVH79LEvg4jRc+889XWLFYjVaRcA4paF+BEJuUITYvTa1Q73oi6eAj
	 DYEoW+L82lnMrP9S2bcLNNcnJsxayrJ8MmDr8zI2mrKD3x7zG+5IdChqSyGBZRGL0j
	 KUobuPxuSGfuw0VLkQvvK9uY8Qd0e/B3wemvujNQIOmgCXD9ZybTi2iN0bKqzk37FA
	 5yP5dFj7aS1Ku/WCcz46zhMxiyziHBk3LqcrqN2uK2GU0oPDxsdcB62ZrzXs79GUzX
	 /Sz9361pBfUpDbUIWANo8vMoMjxHIqObbIbmZiCe3tD7RVbgVo7zqGOEq7PXZ9/xd2
	 sChuVxGgssbgw==
Message-ID: <16fe2bd2-bc9b-f2a1-8d82-f8f089d36f37@collabora.com>
Date: Wed, 13 Jul 2022 10:16:33 +0200
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: Use dev_err_probe on port
 register fail
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Prashant Malani <pmalani@chromium.org>
Cc: kernel@collabora.com, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220712214554.545035-1-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220712214554.545035-1-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 12/07/22 23:45, Nícolas F. R. A. Prado ha scritto:
> The typec_register_port() can fail with EPROBE_DEFER if the endpoint
> node hasn't probed yet. In order to avoid spamming the log with errors
> in that case, log using dev_err_probe().
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

