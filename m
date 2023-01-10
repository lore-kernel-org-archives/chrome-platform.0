Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1654217C7
	for <chrome-platform@lists.linux.dev>; Tue, 10 Jan 2023 03:27:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DC08C433D2;
	Tue, 10 Jan 2023 03:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673321236;
	bh=yVWFm4vPP8REBDfSt15lz6YrnWGShY61kjk14AA5ymY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VbWmRv/DGBYlqYR4JDKRJpqTmM2YpjMLi0nyOv8/H1Q/XiZhXlRcuR/P+L0ZgGfVH
	 29igeb8fzR58vdPrVHWjLucrxHoBsuZ1gRUHy0svr+BuhWF0p66OsIxV7/ifC9RxoG
	 ok+3nfN5NouJigAKGkmR9E0tOW2Up32naEXUD5pZ4HNHp4wf5OPPbmkzPNLgRTWWhp
	 gLpTiOTcUvSSmQcLZj8mn1mr5hvJDpAG+U1XTUzrcT9Yn2tACnObZUcY8yVl1u13oC
	 jrZffEv5aDQHvEMgw0TGpeJ11vOupcXFNyDuhhiXB3McJ0VGXeWmnfGUBVGr2vGVyV
	 3ghZDIonM362Q==
Date: Tue, 10 Jan 2023 11:27:13 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Mark Hasemeyer <markhas@chromium.org>
Cc: bleung@chromium.org, groeck@chromium.org,
	chrome-platform@lists.linux.dev, bhanumaiya@chromium.org,
	error27@gmail.com
Subject: Re: [PATCH] platform/chrome: cros_ec_uart: fix negative type
 promoted to high
Message-ID: <Y7zbEdGeFBxsttQU@google.com>
References: <20230109081554.3792547-1-tzungbi@kernel.org>
 <CANg-bXANdV=EpDu2Zn0BJh5s6cJPYRxyjmVfbWUQ0CufC9CuSA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANg-bXANdV=EpDu2Zn0BJh5s6cJPYRxyjmVfbWUQ0CufC9CuSA@mail.gmail.com>

On Mon, Jan 09, 2023 at 11:51:56AM -0700, Mark Hasemeyer wrote:
> >     175         if (host_response->data_len > ec_msg->insize) {
> >     176                 dev_err(ec_dev->dev, "Resp too long (%d bytes, expected %d)\n",
> >     177                         host_response->data_len, ec_msg->insize);
> >     178                 ret = -ENOSPC;
> >
> > ret = -EINVAL;  (Unless you are discussing harddrives).
> >
> >     179                 goto exit;
> >     180         }
> The report also suggested modifying the return value if a response packet is too
> long.

Replied on the original mail.  Let's discuss the case there if possible.
