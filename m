Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9065B1851
	for <chrome-platform@lists.linux.dev>; Mon, 17 Jul 2023 03:09:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CECB9C433C8;
	Mon, 17 Jul 2023 03:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689563352;
	bh=DRxqjjbEkd/2HTqyHGAyPCFDb21N1UMH/n+hpkxyWrw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L1RNPQnupP9IortcyB4NzYXQ76wS8Gx5mLXQFMJjQQrCBKkU7M8H3QL6bciBXVpsr
	 S7KlZDXH2dj4zVmIY4WBOpvlogveO8eZxLex7Ypwfhs8yoQIlPwSfUY5ygaIlLUaj0
	 2AKNVvG3Aaf63yUm/n0l6OsyqQeecGaBvelnUFqYn/8Di8KEUg6lP2YJBpaRhJMo9H
	 zS6ubp9ORpMVoG1XrDW1Q8G7VN+5OKdWe2r2YadNSO2j+Ca6MpqarTiZlFuoNf3eUt
	 LjxHGHqhht7o1rFH9e7EAPL8LH0nrgqd5hcmkq11e4nc4Fgf++F9yFXP1aGbTbA4/L
	 H83R0mYWWCLxw==
Date: Mon, 17 Jul 2023 11:09:08 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Yiyuan Guo <yguoaz@gmail.com>, lars@metafoo.de, bleung@chromium.org,
	groeck@google.com, dianders@chromium.org, mazziesaccount@gmail.com,
	gwendal@chromium.org, linux-iio@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v3] iio: cros_ec: Fix the allocation size for
 cros_ec_command
Message-ID: <ZLSw1FxccNOqE52C@google.com>
References: <20230630143719.1513906-1-yguoaz@gmail.com>
 <20230716141028.4c57c5c7@jic23-huawei>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230716141028.4c57c5c7@jic23-huawei>

On Sun, Jul 16, 2023 at 02:10:28PM +0100, Jonathan Cameron wrote:
[...]
> 2) Various people commented on earlier versions, and I'm waiting for them to confirm
> they are fine with this version.

The version addressed all my comments and LGTM.
