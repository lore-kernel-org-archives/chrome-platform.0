Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242AF199
	for <chrome-platform@lists.linux.dev>; Thu,  3 Aug 2023 00:20:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 726DFC433C7;
	Thu,  3 Aug 2023 00:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691022000;
	bh=sZptYRYDFoHAb+wOsSizNCW/jt+/ft7PFZewKheT524=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rYZh2Ou5eiiksaJ0lkp7mNnqK/3Vw3Dw5erd0OqvNvnhXHUAejIjuL7ZtxgMylygM
	 uNVn9tZ3XjAfglxx4DqZgZQuUvpQbpZ3CyC0OsVCQa+TsapDwQr2qoG8czG7YwXgzi
	 QH4AnUtu0m29L7ibQliudSn1aPbOqKm9oqODFVWPS/Rr0EkGHamcgudwlJ0eUmD9vi
	 UUY4JQTAk1AyA9tQ4zneX/WRwWkSDonb+eXT1geqlUescolNTMmh8ETndow1MvXqYC
	 6SpbsvnqTRnYMG91iVfqCyS5RpNEQwRLoJT42Afo1LLHBbNgKA5EWgQYqSWxBKEmqi
	 EI5zL15FKhrOQ==
Date: Thu, 3 Aug 2023 08:19:57 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Rob Barnes <robbarnes@google.com>
Cc: patchwork-bot+chrome-platform@kernel.org, bleung@chromium.org,
	groeck@chromium.org, dtor@chromium.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/chrome: cros_ec_lpc: Sync filesystem on EC panic
Message-ID: <ZMryrehtCouCCngA@google.com>
References: <20230726181738.1.Ic6b8e25120b2aec95e3d0f4ac92c2a35fc7a40e8@changeid>
 <169079822136.24246.16960757983645261559.git-patchwork-notify@kernel.org>
 <CA+Dqm30s282gcs6PHkZkH92mhndLi5YP=NPwS0duorizJfx+oQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+Dqm30s282gcs6PHkZkH92mhndLi5YP=NPwS0duorizJfx+oQ@mail.gmail.com>

On Wed, Aug 02, 2023 at 12:16:35PM -0600, Rob Barnes wrote:
> Note: This change is being rejected upstream due to the use of
> ksys_sync_helper. Apparently it's discouraged. I sent a new patch to
> replace this one:
> https://lore.kernel.org/lkml/20230802175847.1.Ie9fc53b6a1f4c6661c5376286a50e0cf51b3e961@changeid/

Do you have any links about the rejection?
