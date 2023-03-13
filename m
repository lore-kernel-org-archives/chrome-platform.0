Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CA223C5
	for <chrome-platform@lists.linux.dev>; Mon, 13 Mar 2023 11:53:06 +0000 (UTC)
Received: from [192.168.1.134] (unknown [213.194.153.37])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: rcn)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A263A6602179;
	Mon, 13 Mar 2023 11:53:04 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678708385;
	bh=XYDR012CqTliSv4p33ERH+MRtK1EKhXtoYHs/0dutaY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RJX8sNoTlE7kCZqWxrJIOU0vG/lxX2wJOP1SCpv4jqjQk8cdoDXLWHAewuvB3OmRC
	 ohMznHrhJ5+00iwDlqfQtS5XK2ylXCtVT42lDfD4NAOWYRt9eCO5scZdb7zXivmOrm
	 ISHhSaFl5BOL3FhreLeczTD7tfgmAe80QD6X5x75aSI1FjdldGfdiSUELhHWNoqEjD
	 3NW42eLrmlhq3NASP8Ik9ebGhzglM22ufoBQ3kkox9WklJ9/iVz7mf33kURwEFP9oV
	 sMOJ2SvqCXT8cyIHxbHZgHw4mtdOtGg1hUnf2S2pahcjM9bNauYJpeu96SwagiD8TR
	 V0aGEYOdAz57Q==
Message-ID: <2915ca22-5942-f5bf-d328-41fe6708622f@collabora.com>
Date: Mon, 13 Mar 2023 12:53:01 +0100
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 00/14] cros-ec-tests: fix some exceptions and clean-ups
Content-Language: en-US
To: Tzung-Bi Shih <tzungbi@kernel.org>, bleung@chromium.org,
 groeck@chromium.org
Cc: chrome-platform@lists.linux.dev, guillaume.tucker@collabora.com,
 denys.f@collabora.com
References: <20230313094431.507952-1-tzungbi@kernel.org>
From: =?UTF-8?Q?Ricardo_Ca=c3=b1uelo?= <ricardo.canuelo@collabora.com>
In-Reply-To: <20230313094431.507952-1-tzungbi@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

On 13/3/23 10:44, Tzung-Bi Shih wrote:> The series changes cros-ec-tests[1].
> 
> It applys some clean-ups and fixes obvious errors.
> 
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/cros-ec-tests.git/

FWIW, there's also this fork [1], that's a bit ahead of [2] and
it's the one we're currently using for KernelCI [3], since Enric
is not maintaining the old one anymore.

Benson, is the cros-ec repo at kernel.org still alive and
maintained? If so we'll sync it to [1] after this patch lands and
point KernelCI to it.

Cheers,
Ricardo

[1]: https://github.com/kernelci/cros-ec-tests
[2]: https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/cros-ec-tests.git/
[3]: https://github.com/kernelci/kernelci-core/pull/1722
