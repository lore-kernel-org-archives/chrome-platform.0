Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79EF1C2B
	for <chrome-platform@lists.linux.dev>; Fri, 28 Jul 2023 06:32:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A350C433C8;
	Fri, 28 Jul 2023 06:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690525932;
	bh=XlJgPdB7Fra49fkaKOTlwTGOzVFQUq9qnjGcmKjDDtg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qUC2itpWcJl5TnE9sR/BkMdqDIvrZ1ybjS3UnhIw6zUGyP7CLHNNf3G27wQIsHd2e
	 ItJ/HqyCYRNU/qsOJ8Kkk6l4IcMALtDyUW/Q++86+gbWdhmXaedkiG8hGKN5fW/bVc
	 hiES124ygVY0sdN1SixB0UZuzCqWfU1j4zV3AXsNxtvHKUlZ7oTHgjz9pm5M/BEtLT
	 sD5WLVtGGE3T7BLjbwk0jt2UukknCQQT25CWmCnl6A4BzC3IjqdVJO5cBfMFU1oeYx
	 OpuC0AYrbB6EAoh5go2FMhPENFbY/Idp+oHbtw6wGa/vA+rlMRfcP4FLr6s2zSZUjj
	 4+snmm+w+oxcg==
Date: Fri, 28 Jul 2023 14:32:08 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: bleung@chromium.org, groeck@chromium.org, rafael@kernel.org,
	lenb@kernel.org, chrome-platform@lists.linux.dev,
	linux-acpi@vger.kernel.org, guillaume.tucker@collabora.com,
	denys.f@collabora.com, ricardo.canuelo@collabora.com
Subject: Re: [PATCH] platform/chrome: chromeos_acpi: use official HID GOOG0016
Message-ID: <ZMNg6NYSgTf3mIRJ@google.com>
References: <20230728014256.3836298-1-tzungbi@kernel.org>
 <fb9876f1-e729-f2d3-75d8-55fdae24e3ee@collabora.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fb9876f1-e729-f2d3-75d8-55fdae24e3ee@collabora.com>

On Fri, Jul 28, 2023 at 10:59:22AM +0500, Muhammad Usama Anjum wrote:
> On 7/28/23 6:42 AM, Tzung-Bi Shih wrote:
> > Use official HID GOOG0016 for ChromeOS ACPI (see [1]).
> > 
> > [1]: https://crrev.com/c/2266713
> > 
> > Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> > ---
> > AFAIK, there has no ChromeOS devices using the driver yet.  Instead, they
> > still stick to some downstream implementation.  IOW, I guess we are safe
> > to just replace the PNP ID.
> GOOG0016 got introduced in newer firmware. Older firmware will still have
> only GGL0001 id. Lets keep both IDs otherwise the updated driver will not
> work on older chromebooks. This can be easily achieved by keeping both IDs
> in chromeos_device_ids.

Thanks for the review.  I overlooked the case.  Will fix it in next version.

So if I'm looking for the path, whether it bases on "GOOG0016" or "GGL0001",
it actually depends on what firmware the system has?
