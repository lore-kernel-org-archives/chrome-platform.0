Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010CBA23
	for <chrome-platform@lists.linux.dev>; Thu,  3 Nov 2022 08:52:36 +0000 (UTC)
Received: from [192.168.231.135] (unknown [213.194.153.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: rcn)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CEFFD66028F8;
	Thu,  3 Nov 2022 08:52:28 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667465549;
	bh=fsZcq1gUvDx3IxVmX3Sik7AGvSK34gT/CWhzh+CJvN0=;
	h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
	b=hMy7xzuYtYH8Lw4Z90pXZk0jxJCXehwlVar3kTLD2vUm02gwckygXFb8LdnMQPK0n
	 JLjdECjO+MPdTKzIydLWpO11Rt0rhfn7C26VzYUz/Pmqz9uoMixF7KTDaVjTrful4f
	 Y4FSHM9BNbuIMbEMdiFEtg4ibyUIMoZwtl0ALozrlVHamwYwmnx3K8ffq9/1+rWlDF
	 +F98INm2mevS5HLeIY5dRh8T100Nm6yvHbaiOKL7DhyGxURYJb/Rbkzm1y0sS77Zg3
	 oQd6FC9iDN3ICBaTxYICnuKVXjdWOtGzCW3tfeTVi/WMygc7/4lEnecxsJxd+g1Qhj
	 pBG6BCYNE+Gig==
Message-ID: <76f4b127-35bc-f3f3-f4f2-3678d40c8219@collabora.com>
Date: Thu, 3 Nov 2022 09:52:26 +0100
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: chrome-platform/for-kernelci baseline: 93 runs, 7 regressions
 (v6.1-rc1-12-g52f572342440)
Content-Language: en-US
To: "kernelci.org bot" <bot@kernelci.org>,
 kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
References: <63625738.620a0220.d2e29.f2f7@mx.google.com>
Cc: tzungbi@google.com
From: =?UTF-8?Q?Ricardo_Ca=c3=b1uelo?= <ricardo.canuelo@collabora.com>
In-Reply-To: <63625738.620a0220.d2e29.f2f7@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

+Cc Tzung-Bi

I'm starting to investigate these, I'll create buganizer tickets as needed
to follow up on them.

Cheers,
Ricardo
