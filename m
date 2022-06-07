Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D817C
	for <chrome-platform@lists.linux.dev>; Tue,  7 Jun 2022 00:55:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4715FC34119;
	Tue,  7 Jun 2022 00:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654563315;
	bh=mEAGnwqSmfFEQzXLnJQtDlQVJh1cDCMLRlxqEbnIyo4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kX+959qyO9qA5XrWtm1eZuVeZ311W/2joLYgPAGSShygut4tzCKMraGVoXEH+6As7
	 6RiS48u1jfapWrvE1rNv00+ipINysYMszqoWx39Hqs+7/7z0bSCUYIURqgQdcT/nhd
	 wbAYBROahsqXPoQJ+LrPKaRVhWu+k75dOHbmAU435BTYzRl8yjV/rbIy9zg42PkUcf
	 RZlBo2dOb9Q5wuGcCgv1SVDEllxKMwYOXtLdBes9Aqa7cMcZ0BBWjsD3Nglop/F8fp
	 A3X81heSmiYVKLwAvSOFLDiJzRrZJeSb/TcBLFOh+5eY/Mq/xpFHwgBaVH5N3JYh5l
	 9IzjVHF/iMaag==
Date: Tue, 7 Jun 2022 00:55:12 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <groeck@google.com>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 08/13] platform/chrome: cros_ec_proto: separate
 fill_protocol_info_legacy()
Message-ID: <Yp6h8DCbfdodbdZB@google.com>
References: <20220606141051.285823-1-tzungbi@kernel.org>
 <20220606141051.285823-9-tzungbi@kernel.org>
 <CABXOdTcJiytvKpQhbka5cLySiM+_aUAS-k0COu+xteaAVKqttQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABXOdTcJiytvKpQhbka5cLySiM+_aUAS-k0COu+xteaAVKqttQ@mail.gmail.com>

On Mon, Jun 06, 2022 at 09:06:35AM -0700, Guenter Roeck wrote:
> On Mon, Jun 6, 2022 at 7:12 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> >
> > Rename cros_ec_host_command_proto_query_v2() to
> > fill_protocol_info_legacy() and make it responsible for setting `ec_dev`
> 
> cros_ec_get_proto_info_legacy() ?

Ack, will fix in next version.
