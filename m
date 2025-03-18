Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED58420DD7D
	for <chrome-platform@lists.linux.dev>; Tue, 18 Mar 2025 14:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742307687; cv=none; b=UhOkr2gNNcKEovptQb9XSbwc61JxuePvOKPCEHmclM++kpu4Rl0swlXZtEWJY4IswADnuF122ItgOz7ossNVgcb0mO5z9NZgLKaq4lkOQGJHkD+z1+mmsW3clGJ3KLIkJm8gNh9xVu52NLUcP3o7GrEYPcf+GJklsyPf/O6YM6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742307687; c=relaxed/simple;
	bh=DlTALxhnX1WzQznDtq8NeSAib+9haWmUV8E0yQEGDc4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DGBdG1P2m5svNgna6rVpICSW4r2PqMdBhBpEQqQKI1jpIo8urCH6eki6wb1oNxQwUtY7a+eqBqhx3VoqTHUfM8Y3Ogzl5s6qjNkNbm1ZiYD67oOgP0qPLHy5J/+1bqEMc2MPRzBTrrEQV4Rlj4KDME9TzC+F/rdvD6Uk7zU+mAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KhDI9DBX; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KhDI9DBX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742307683;
	bh=DlTALxhnX1WzQznDtq8NeSAib+9haWmUV8E0yQEGDc4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KhDI9DBXFlIC2GO3+W6xzD9tsjvysmhhYIc+vB+keu4md9fXlwTSNN4CksQ8fRMTl
	 zXwvLnNHqzHqdGDsuZ9fjcgD/0qrG7V+40I63YqSxeZpVkroSWG4j2tDva1KtU3mcN
	 E5toQgEr5RwPfvPfuFv/hteWGM0Hc2p4WpGsUVQIIDBoxs3sBCHbERCNtwecdrsLm0
	 ZSeo6csHIPCbHDRGzJW3ZXLejGyvelgQ9Eb+yz0K92U8T8Z3hu5ldPzf8enVT+dbRD
	 sgzuE/Vbz/iVoNUYTF1L1zXDbUz/eccgz3ikGnghE06aZAnh+iPV9Gfs1yXPXRPokt
	 7JXxZGlh3AMAQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 906DA17E0B25;
	Tue, 18 Mar 2025 15:21:22 +0100 (CET)
Message-ID: <2b666683-47f9-44b5-bae9-109764e60690@collabora.com>
Date: Tue, 18 Mar 2025 15:21:21 +0100
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/chrome: Add support for Google Spherion in
 HW prober
To: Laura Nao <laura.nao@collabora.com>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, bleung@chromium.org,
 tzungbi@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 chrome-platform@lists.linux.dev, nfraprado@collabora.com,
 kernel@collabora.com
References: <20250318102259.189289-1-laura.nao@collabora.com>
 <20250318102259.189289-2-laura.nao@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250318102259.189289-2-laura.nao@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 18/03/25 11:22, Laura Nao ha scritto:
> Add a new compatible entry for "google,spherion" to the hardware prober
> platform list, using the same I2C component prober and trackpad data as
> "google,hana".
> 
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


