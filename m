Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C8B13AD22
	for <chrome-platform@lists.linux.dev>; Wed, 17 Apr 2024 13:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713361945; cv=none; b=sjmPavy2Bpg6bw2sJ9XYecmD13NFPX/0uSdIw06DcOd643MJUVodtVerzPrnCRbigdeoyNV9veVF8KBhSQN2H0e4F1ehlZGvGQyMZnw80Hk5Em70vDzwHZz+cRJ2rM1iNU/58fbmqfkUGu5omrQs3Llz1lCo7W6jYYELX/nlX00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713361945; c=relaxed/simple;
	bh=VxunfktQMOjppOCQpES9K8zlG6woQD+gav0HVLUYdWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=QzRr1mOSwGAseqNlI1327cDrVhPiNHph6UUyk5CkquYFuuKZiJxXYytVfFwbICmRqawEBJhH8qUHdt8ztY9Z5i43XNh1ZG8J9yOvPt+Zns8qnrMEzmRF4Uo0aHCe868/kJZBxv8QiNuZ3VD6B0GHnGLyLEPFWVTWyyNilY31EZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Mykj5nAq; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Mykj5nAq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713361942;
	bh=VxunfktQMOjppOCQpES9K8zlG6woQD+gav0HVLUYdWw=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Mykj5nAq4uZmDGUy8aeGxuqe1I9F/q86kU0nNQ1xVNXcg8XVae31Bm2y0lTzMLRxz
	 sCbBts3Q1SnTtyf+WFufvN7v6WNYpJwBUoN1k7kZTBFXzQr3V5p5NWX3Od/aVo/z13
	 dcyJZqtU2prWJkdPjLYZkRNp7EoJzGjc7SHTX5MKlH0rQh2+K9hh1JGB/+PJkfi8iK
	 58QYY/y1ZXU2KXl29NUD5sHJrhTDD3on7edMTS7rVk+37dU6erHEzcqvjviarUFc6h
	 M0BkSzY5TVdDI0g1canrfGMTmTSWsLkVVnnRDYmVwIiYpaCBC2x2gaSqy9+8cL/6e8
	 jsIu2PVVQMrHQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7EB49378001E;
	Wed, 17 Apr 2024 13:52:21 +0000 (UTC)
Message-ID: <275e760d-e4e2-4a6b-88f7-9a8590b0773b@collabora.com>
Date: Wed, 17 Apr 2024 15:52:20 +0200
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/mediatek/dp: fix mtk_dp_aux_transfer return value
To: Wojciech Macek <wmacek@chromium.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 chrome-platform@lists.linux.dev
References: <20240417103819.990512-1-wmacek@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240417103819.990512-1-wmacek@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 17/04/24 12:38, Wojciech Macek ha scritto:
> In case there is no DP device attached to the port the
> transfer function should return IO error, similar to what
> other drivers do.
> In case EAGAIN is returned then any read from /dev/drm_dp_aux
> device ends up in an infinite loop as the upper layers
> constantly repeats the transfer request.
> 
> Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver")
> Signed-off-by: Wojciech Macek <wmacek@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


