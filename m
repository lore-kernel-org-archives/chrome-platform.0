Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D188018E03
	for <chrome-platform@lists.linux.dev>; Fri, 10 Nov 2023 18:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="f2ksT5QD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UkeffA2vSHpOXayjcOQRwDykg5JYTTVBikvJKRaYmgk=; b=f2ksT5QD9cT7H8uSap3qPHtuR3
	RG86H6Shv3V/1HqpllsDTpnrcpRiP04KKabC4c4hRR9cZqSsh39ebrJpw3MkG3DVEzDJ/8R03jslH
	OfKlvgRWq9zcqbfWK/q0W+XhWobJED6FUyNeY8YfHuTm3GtjnW/PvNAVcCG14F5BW1i4aXYu4EhVf
	F7LFAhCWtsZ5NgqNkcsLe8R4Ak9u9/TsWdQVqOx+LUKA0KF1QN27/dy6vrtyfu/sgGqdIO4ovgEjx
	aKr9sU5WOWrmSNl+pBEMzjnY2FXGPjH9PkZu2KJlKPm+ZnAmwfcg7HRiERJeyog2OOPaPFE/5wsXw
	yf+0dGdw==;
Received: from [2603:3004:644:9100::58b]
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1r1WKy-00FmxH-2i;
	Fri, 10 Nov 2023 18:34:37 +0000
Message-ID: <0c264881-f54c-4db3-ae6d-34facc31c9e7@infradead.org>
Date: Fri, 10 Nov 2023 10:34:31 -0800
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/chrome: sensorhub: Fix typos
To: Kuan-Wei Chiu <visitorckw@gmail.com>, bleung@chromium.org,
 tzungbi@kernel.org
Cc: groeck@chromium.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <ZU3GbHTA3x19h2Zi@google.com>
 <20231110165239.1559109-1-visitorckw@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20231110165239.1559109-1-visitorckw@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/10/23 08:52, Kuan-Wei Chiu wrote:
> Replace 'preceeds' with 'precedes' in the comment.
> Replace 'porod' with 'period' in the comment.
> Replace 'noone' with 'no one' in the comment.
> Replace 'lantency' with 'latency' in the comment.
> Replace 'kifo' with 'kfifo' in the comment.
> Replace 'change' with 'chance' in the comment.
> 
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
> v1 -> v2:
>  * Separate patch series into two patches.
> 
>  drivers/platform/chrome/cros_ec_sensorhub_ring.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

