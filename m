Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB806004
	for <chrome-platform@lists.linux.dev>; Thu, 14 Jul 2022 17:29:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED2CBC34114;
	Thu, 14 Jul 2022 17:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1657819776;
	bh=eo67ao+PmEWgpCKzwt6V2TacgfLQ/ODBJXB/xIJDpTo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nGIusFj9Kp+eKcydlmMP+BeXbVLtDjVYAw4xJr2F690moNFmNRmQuv6q/wOhcS52a
	 Q0ykG9wQIP/LAR3FmDk61Qv0QRODUD47sdFfkqJX2PrHzqqkW8b1MDbAdou9M9KJwe
	 WCfx1KeVlTxPhfB9a2jEJcLwQoyNIat1eszCsu+o=
Date: Thu, 14 Jul 2022 19:29:33 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev, bleung@chromium.org,
	heikki.krogerus@linux.intel.com,
	Daisuke Nojiri <dnojiri@chromium.org>,
	"Dustin L. Howett" <dustin@howett.net>,
	Guenter Roeck <groeck@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v4 0/9] Type-C switch driver and Type-C framework updates
Message-ID: <YtBSfeKKGrFx3wA3@kroah.com>
References: <20220711072333.2064341-1-pmalani@chromium.org>
 <YtAkeQ1Do7CuM/PR@kroah.com>
 <CACeCKaekD4S93XbYGOia+vuCwc+oRJpcNKVgrxEasa4MDGsSoQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACeCKaekD4S93XbYGOia+vuCwc+oRJpcNKVgrxEasa4MDGsSoQ@mail.gmail.com>

On Thu, Jul 14, 2022 at 10:02:32AM -0700, Prashant Malani wrote:
> Hi Greg,
> 
> On Thu, Jul 14, 2022 at 7:15 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Mon, Jul 11, 2022 at 07:22:54AM +0000, Prashant Malani wrote:
> > > This series introduces a retimer class to the USB Type-C framework,
> > > It also introduces a Chrome EC (Embedded Controller) switch driver which
> > > registers the aforementioned retimer switches as well as mode-switches.
> > >
> > > Patch 1 and 2 introduce the retimer class and associated functions to
> > > the Type-C common code.
> > >
> > > Patches 3-7 add the cros-typec-switch driver.
> > >
> > > Patches 8-9 update cros-ec-typec to get and use retimer switch handles.
> > >
> > > Submission suggestion (as always, open to better suggestions):
> > > - Patch 1 and 2 can go through the USB repo.
> > > - Patch 3-9 can go through the chrome-platform repo. Since they depend
> > >   on patches 1 and 2, we can create an "topic branch" off of usb-next
> > >   once Patch 1 and 2 are submitted, and then apply Patches 3-9 on top
> > >   of that "topic branch" before merging it back into chrome-platform's
> > >   for-next branch
> >
> > That's a mess, I can just take all of them into my tree if you want.
> 
> That works for me. Thanks for taking Patch 1 and 2; it should be fine
> to apply the rest of the patches to your tree too.

Ok, now queued up.

greg k-h
