Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54B020371E
	for <chrome-platform@lists.linux.dev>; Tue, 18 Mar 2025 14:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742308587; cv=none; b=iYm75UbLNomPrLB8qF8ZAR1LJ1ik3ErNrLvoWxmgs+2At2xcy0JWqHlT+7UwJFTjjGVqJ8Ac5DsbdZHK4MJO+pJ8S73hXqTnNpZomggboAFI9Dt5r3ADJ69EhM4nUxIYVwPZmmM4OuTTFZTIRqZrl9Y77ZtSZwsLXVMr6Z0Ru9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742308587; c=relaxed/simple;
	bh=BszjjWPBiRXCAq9+SjLvTIzV/2BzX1g3T0xH6nCwWTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wzt/71CqJwmPAcskuc12GecvLfZmOJF+thXwSayVUAJLeXk2OOLUtav98im14xKKtbB8m50lA2PaiFWJNs/3/bmbisZNUiO21LU+8lqnjDkrT83nCPv5YvNe/R4iKL+qvcaS1mQkmzSvVa418lx0waE4zZppBOrDBt/yj0TTwvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=N9qbVU5k; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="N9qbVU5k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742308583;
	bh=BszjjWPBiRXCAq9+SjLvTIzV/2BzX1g3T0xH6nCwWTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N9qbVU5kRtV+7KHu9rj0ev9uLjhEERqRjGZc2JknKYmkqnLDdRbS73dXu3N5PptlM
	 jqtS6nFT+FEUsZTU8k8AAaKRu8pTCGU9PMh1t278ce68Q8SNcPp2ldlbbierlK66GW
	 pS+xYzH7KVviklv9a899v8A5IMMnRsJ9Y3gIT51JBqyjbrcFykUP+q+htdaEp/yQgI
	 OG4LYUJOCyp15uXDW7Rp9Ni1iYQSiblqenNuFCPdHXaq4P2SBEyRcUt5wxa+1utZHB
	 NskUmH0ZkkMQKOGTorPj8GxA0dKf26K0wor4ucSYqYN8Mt0KcZSD227oZWJ5OvPXBw
	 LsOmwZoAqAEuw==
Received: from notapiano (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6CA6317E0385;
	Tue, 18 Mar 2025 15:36:20 +0100 (CET)
Date: Tue, 18 Mar 2025 11:36:18 -0300
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Laura Nao <laura.nao@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	bleung@chromium.org, tzungbi@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
	kernel@collabora.com
Subject: Re: [PATCH 1/2] platform/chrome: Add support for Google Spherion in
 HW prober
Message-ID: <f74001b3-ea40-4acc-b8a1-635532a5f205@notapiano>
References: <20250318102259.189289-1-laura.nao@collabora.com>
 <20250318102259.189289-2-laura.nao@collabora.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250318102259.189289-2-laura.nao@collabora.com>

On Tue, Mar 18, 2025 at 11:22:58AM +0100, Laura Nao wrote:
> Add a new compatible entry for "google,spherion" to the hardware prober
> platform list, using the same I2C component prober and trackpad data as
> "google,hana".
> 
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas
