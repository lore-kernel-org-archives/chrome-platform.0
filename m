Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DED7A
	for <chrome-platform@lists.linux.dev>; Thu,  9 Jun 2022 05:09:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 014C6C34114;
	Thu,  9 Jun 2022 05:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654751346;
	bh=VmI5ZpIXTp9MnI4+dGgRn5ZVS3Q0GQ1DEje/j6+uJX4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cwNlJJ5WUsHih6dgYXLhQXO23e4U3qFvVp2rbyul3rs+YOUxXaPBqo6VnACVfy6eA
	 jybfoLpJPFZnDSkVR972d8G53Gzh4CzQytrv2Ye8dESTCM9XLLVOZRc+c1u9Jp4PlS
	 QNZj0N3FhI2zd0yqqXLaffNCRlXvnBBBOt4oKgvB+GeYFt0+zQk6wIji7w+KgnZ/EA
	 ob+Tb/5GWg47EQBfvN5OkV4ipsdHpgkTQsTYd50mq0cYPpLnymkZGEJfd8YhxzS94a
	 thL/EH7M4arphzsfOM+Wj1RUotLgwcG+2tmXz1i9v/EUe+byEr9h+cg/iZQKhlO/cZ
	 BrEWecLF+/1iw==
Date: Thu, 9 Jun 2022 05:09:03 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <groeck@google.com>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 13/23] platform/chrome: cros_ec: don't allocate `din`
 and `dout` in cros_ec_register()
Message-ID: <YqGAb9ApjYEFHoEX@google.com>
References: <20220608110734.2928245-1-tzungbi@kernel.org>
 <20220608110734.2928245-14-tzungbi@kernel.org>
 <CABXOdTegzx8Xpp3QPn8XyjLt1Rdr7ztkLcY53+vHmEEVKYSr4Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABXOdTegzx8Xpp3QPn8XyjLt1Rdr7ztkLcY53+vHmEEVKYSr4Q@mail.gmail.com>

On Wed, Jun 08, 2022 at 09:15:56AM -0700, Guenter Roeck wrote:
> On Wed, Jun 8, 2022 at 4:08 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> >
> > Don't allocate `din` and `dout` in cros_ec_register() as they will be
> > allocated soon in cros_ec_query_all().

Pardon me, I should test them earlier.

I misunderstood.  The patch will cause kernel crash (NULL dereference)
because cros_ec_query_all() relies on `din` and `dout` for getting protocol
info and then it reallocates the buffers according to the info later.

I think we should just leave them as they are.  Will drop this patch and next
patch ([v3,14/23] platform/chrome: don't use devm variants for `din` and
`dout`).
