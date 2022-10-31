Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFB217F3
	for <chrome-platform@lists.linux.dev>; Mon, 31 Oct 2022 05:14:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C338C433D6;
	Mon, 31 Oct 2022 05:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667193285;
	bh=p5ZgX/IINCaomygMkreoSZQxx18wOxhDfxTDxfcD1Sc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NOryPj0o78YN9JMibuTqEm+q6JA32KGrhtQ5/QJunBFKVRJhCmH8K5ofCsclLn1lv
	 nC28YrjTsoo1qVYHDa26OzYNwiT0YZeqETBd6volezRMa2nziFGI3jP8Qjij7yozX3
	 DsfzSs3elqEzECzTkJq7SFJlf9OKv9tSxAh2Bhr8S68/V4uYjsU6jJ9q9gruhKEcnu
	 aRGF7Tj2YZrOc/5IYgKmuyIvHSe7pxQ7U06rMIO3JEOPOOFlfHMQiAsl6q1hhuf3ZS
	 Yk30/k2lZLnfP5ZBSsg2guNXtO3du2ENkE6u7nHZywlokgOACLywhOB2ljqOUzJwT0
	 pM5hvJU1lNZUw==
Date: Mon, 31 Oct 2022 13:14:41 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Brian Norris <briannorris@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] platform/chrome: cros_ec_lpc: Move mec_init/destroy
 to device probe/remove
Message-ID: <Y19ZwWXnnl89i1QI@google.com>
References: <20221028141411.1.I0728421299079b104710c202d5d7095b2674fd8c@changeid>
 <Y19VXaB1531V64EI@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y19VXaB1531V64EI@google.com>

On Mon, Oct 31, 2022 at 12:55:57PM +0800, Tzung-Bi Shih wrote:
> On Fri, Oct 28, 2022 at 02:14:45PM -0700, Brian Norris wrote:
> > Disregarding the weird global state hiding in this cros_ec_lpc_mec_*()
> > stuff, it belongs in device probe/remove. We shouldn't assume we can
> > access hardware resources when the device isn't attached to the driver.
> 
> It's also weird that cros_ec_lpc_mec_destroy() destroies a statically
> allocated mutex[1].  How about let's remove it?

If it makes sense:
https://patchwork.kernel.org/project/chrome-platform/patch/20221031050657.3899359-1-tzungbi@kernel.org/
