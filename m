Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C257C
	for <chrome-platform@lists.linux.dev>; Fri, 18 Nov 2022 06:48:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9537EC433C1;
	Fri, 18 Nov 2022 06:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668754116;
	bh=e4KWQDcqGgcaW/J8qpDH882iV2/keATd9urAwilXHuE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JtACASBGtiC4T1CxunomRtyGWWg3aGo9PW1JAYzw0l1nC93AsD4ZiBcYekHAlaYyZ
	 4+QViW+A5yM9Jz6GVCJKHr7/ZerkrWPDCft7P1qPc4rvo3PpxAoL6yLLHdZfxMlRR2
	 iKAykWVaP+qmAiQOBZ/FjmJdDEPQFmRo9X7VHZrCIgdMICV7bu7BBJLKY4AxN6Hm9C
	 XLX6I6Tr9xA0+yX5bZCyaZrp/BdwSGUTLpfrNgtFkZVszcXSWiLkf5vs2NfswSLy/y
	 yiGNny98ZFj22WHnEPXj4/S+O9xOd2go1+UJlQL6OklIbbDw5gS45KTytDfunCEXUI
	 bUkjnmZwxwqQg==
Date: Fri, 18 Nov 2022 14:48:32 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Gwendal Grignou <gwendal@chromium.org>
Cc: dtor@chromium.org, jwerner@chromium.org, bleung@chromium.org,
	enric.balletbo@collabora.com, groeck@chromium.org,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Subject: Re: [PATCH v3 1/1] platform/chrome: Poke kb_wake_angle attribute
 visibility when needed
Message-ID: <Y3cqwEIueri63XzH@google.com>
References: <20210804213139.4139492-1-gwendal@chromium.org>
 <20210804213139.4139492-2-gwendal@chromium.org>
 <CAPUE2usQX_uQewpCYOs3SRUo7vDDMfg=n7idNvCgThDHMqTf7w@mail.gmail.com>
 <CAPUE2uuj1qde16QWHb=0+yMW3ERhXzV7ehGcViWCfij7ADeyWg@mail.gmail.com>
 <Y3bnYT6TXGXhkh/T@google.com>
 <CAPUE2uuUn33yRMz77+XxZvK9bDzAA8u3SLBx=iDfAJc6WrUEEQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPUE2uuUn33yRMz77+XxZvK9bDzAA8u3SLBx=iDfAJc6WrUEEQ@mail.gmail.com>

On Thu, Nov 17, 2022 at 10:41:06PM -0800, Gwendal Grignou wrote:
> On Thu, Nov 17, 2022 at 6:01 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> >
> > On Wed, Nov 16, 2022 at 10:23:38AM -0800, Gwendal Grignou wrote:
> > > [+chrome-platform@lists.linux.dev]
> >
> > Please also Cc to the mailing list if the patch gets chance to have
> > next version.
> >
> > > On Mon, Nov 14, 2022 at 8:10 PM Gwendal Grignou <gwendal@chromium.org> wrote:
> > [...]
> > > > > Expose the attribute group to alter to close a potiential race between
> > > > > cros-ec-sensorhub and cros-ec-sysfs (that creates the attribute group
> > > > > on behalf of the class driver).
> >
> > I failed to realize the potential race.  Could you explain it a bit?
> The decision to show or not an attribute is done at the attribute file
> creation time, once. If the module cros_ec_sysfs is loaded before
> cros_ec_sensorhub, the attribute kb_wake_angle will never be shown. If
> it is loaded after, and there are 2 accelerometers, the is_visible()
> function will return true and the attribute is shown.
> 
> This patch ensures the attribute is_visible() is run again after the
> sensorhub driver is loaded.

I see.  Thanks.
