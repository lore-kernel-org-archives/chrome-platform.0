Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646DA7F
	for <chrome-platform@lists.linux.dev>; Thu,  3 Aug 2023 01:23:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57BDEC433C7;
	Thu,  3 Aug 2023 01:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691025831;
	bh=mwt6Ha3JP6+NzoMV6iJvPhu0DizfeXkCYmte5+a5R3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iD/lsQI3m+iarXjVvd/DvNwuZIwvU5terh8t+imWahWNOMZ4qc9kOG07y8K4J1GCD
	 ZblJW2+zHpTduBoHNuUaPo4a0wocpzUEOb7GzsCTV3CSJJOVtV/SBHZf/MDtZdhAGA
	 nXQl/2YKKIyj91zViwvB2ccJKtnk4Zs9Wi49FuiFiXhtw5VVSo5bYDc8v6L24DhqdW
	 boBczeIIkR29DF2dIHMhB7WkLqnvy5BdQlSfyAVCt8qSwl7SXkxX2tNUdSnr4S59B0
	 shgo3jEAZdijrHdY4fIjeqO343OWorHxREUL5y2zmuQVHGWgkpA1GRZXN6zEe+brAz
	 icLY684iIaH1A==
Date: Thu, 3 Aug 2023 09:23:48 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: bleung@chromium.org, groeck@chromium.org,
	chrome-platform@lists.linux.dev, guillaume.tucker@collabora.com,
	denys.f@collabora.com, ricardo.canuelo@collabora.com,
	briannorris@chromium.org
Subject: Re: [PATCH v2] platform/chrome: chromeos_acpi: print hex string for
 ACPI_TYPE_BUFFER
Message-ID: <ZMsBpMDK5iXwFa+S@google.com>
References: <20230802095736.3079963-1-tzungbi@kernel.org>
 <1be7888e-2346-99b1-4c31-f755fcbd054a@collabora.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1be7888e-2346-99b1-4c31-f755fcbd054a@collabora.com>

On Wed, Aug 02, 2023 at 08:15:31PM +0500, Muhammad Usama Anjum wrote:
> On 8/2/23 2:57 PM, Tzung-Bi Shih wrote:
> > `element->buffer.pointer` should be binary blob.  `%s` doesn't work
> > perfect for them.
> > 
> > Print hex string for ACPI_TYPE_BUFFER.
> > 
> > Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> Please add fixes tag and CC stable as well (stable@vger.kernel.org) in next
> revision.
> 
> Fixes: 0a4cad9c11ad ("platform/chrome: Add ChromeOS ACPI device driver")

I think a Fixes tag should be sufficient.

Fix in v3 (https://patchwork.kernel.org/project/chrome-platform/patch/20230803011245.3773756-1-tzungbi@kernel.org/).
