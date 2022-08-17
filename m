Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACECC7B
	for <chrome-platform@lists.linux.dev>; Wed, 17 Aug 2022 01:48:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B6A1C433D6;
	Wed, 17 Aug 2022 01:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660700939;
	bh=FAR+u1EOovTvzVVro+BUSVCe8k8Zki9e4ZhgM5ZaS+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OUc8cwBeBlns6irfAuaeOOvKVduIFcntX30RHETmYcZrrEoUK/PI0dCOtA70inqNR
	 QyZ2Jm5EYhtDMvJhmq4bcJnrRLfkiNC3OGwsemVpyqtJvSnyiEP+9wBzaGrR5BRRyB
	 qRLsqT6TgMRl0nj11vQGedQ8DPyRRRwh/xLHYLYpV38C4N6llmVC2wesOOlSGTIkTa
	 D+WXMayUAN4vWUhjOXK2nUvjJotvlkEXiQYQfV6Jfw11/os3v/LGwkBzL4qD4y5Rzl
	 JbXyEYEnFXWKosQN8bo2JE2kKGOJET5rmbuJaFJk0o04lk9Ime5m5GEq1kG/fPN3ac
	 xtco+E4YCiveQ==
Date: Wed, 17 Aug 2022 01:48:55 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	bleung@chromium.org, Daisuke Nojiri <dnojiri@chromium.org>,
	"Dustin L. Howett" <dustin@howett.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Kees Cook <keescook@chromium.org>, Lee Jones <lee.jones@linaro.org>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Xiang wangx <wangxiang@cdjrlc.com>
Subject: Re: [PATCH v6 4/7] platform/chrome: cros_typec_switch: Add event
 check
Message-ID: <YvxJB3SQv9yp8pCD@google.com>
References: <20220816214857.2088914-1-pmalani@chromium.org>
 <20220816214857.2088914-5-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220816214857.2088914-5-pmalani@chromium.org>

On Tue, Aug 16, 2022 at 09:48:32PM +0000, Prashant Malani wrote:
> The ChromeOS EC updates Type-C status events when mux set requests from
> the Application Processor (AP) are completed. Add a check to the
> flow of configuring muxes to look for this status done bit, so that
> the driver is aware that the mux set completed successfully or not.
> 
> Signed-off-by: Prashant Malani <pmalani@chromium.org>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
